class Indicator < ActiveRecord::Base
  attr_accessible :title,
                  :number,
                  :units,
                  :snapshot_ids,
                  :subject_id,
                  :explanation_attributes,
                  :issue_area_ids,
                  :id,
                  :objective_id,
                  :threshhold,
                  :higher_value_is_better,
                  :lower_rank_is_better

  belongs_to :objective
  belongs_to :subject

  has_one  :explanation, as: :explainable
  has_many :snapshots
  has_and_belongs_to_many :issue_areas

  accepts_nested_attributes_for :explanation

  validates :title,  presence: true, length: { maximum: 160, minimum: 8 }
  validates :number, presence: true
  validates :units,  presence: true, length: { maximum: 140 }

  default_scope { order('id ASC') }

  def goal
    objective.goal unless objective.nil?
  end


  def passing?
    return nil if threshhold.nil?
    status = ( value > threshhold )
    higher_value_is_better ? status : !status 
  end

  def failing?
    return nil if threshhold.nil?
    !passing?
  end

  def passing
    :passing if passing?
  end

  def failing
    :failing if failing?
  end

  def incr_decr
    return nil if value_delta.nil?
    return :stagnant if value_delta == 0
    value_delta > 0 ? :improving : :declining
  end

  def rank_incr_decr
    return nil if rank_delta.nil?
    return :stagnant if rank_delta == 0
    rank_delta > 0  ? :improving : :declining
  end

  def rank_position
    case rank
    when 1..10
      lower_rank_is_better ? :passing : :failing
    when 11..15
      :stagnant
    when 16..25
      lower_rank_is_better ? :failing : :passing
    end
  end


  def improving?
    return nil if value_delta.nil?
    trend = ( value_delta > 0 )
    higher_value_is_better ? trend : !trend
  end

  def stagnant?
    return nil if value_delta.nil?
    value_delta == 0
  end

  def trend
    return nil        if  value_delta.nil?
    return :stagnant  if  stagnant?
    return :improving if  improving?
    return :declining if !improving?
  end


  def rank_improving?
    return nil if rank_delta.nil?
    trend = ( rank_delta < 0 ) # rank should be decreasing i.e. moving toward 1
    lower_rank_is_better ? trend : !trend
  end

  def rank_stagnant?
    return nil if rank_delta.nil?
    rank_delta == 0
  end

  def rank_trend
    return nil        if  rank_delta.nil?
    return :stagnant  if  rank_stagnant?
    return :improving if  rank_improving?
    return :declining if !rank_improving?
  end


  def reverse_comparisons
    self.update_attribute(:higher_value_is_better, !higher_value_is_better)
    self.update_attribute(:lower_rank_is_better,   !lower_rank_is_better)
  end


  DEFAULT_YEAR = 2000

  def current_value
    current_snapshot.value
  end

  def current_rank
    current_snapshot.rank
  end

  def current_rank?
    !current_snapshot.rank.nil?
  end

  def value_in(year=DEFAULT_YEAR)
    snapshot_in(year).value
  end

  def rank_in(year=DEFAULT_YEAR)
    snapshot_in(year).rank
  end
  
  def snapshot_since(year=DEFAULT_YEAR)
    date = DateTime.new(year.to_i)
    self.snapshots.where('date BETWEEN ? and ?', date.beginning_of_year, DateTime.now.end_of_year).order('date DESC').first
  end

  def value_delta(year=DEFAULT_YEAR)
    current_value - value_in(year) unless snapshots.empty?
  end

  def rank_delta(year=DEFAULT_YEAR)
    past_rank = rank_in(year)
    current_rank - past_rank unless snapshots.empty?
  end

  alias_method :value, :current_value
  alias_method :rank,  :current_rank
  alias_method :rank?, :current_rank?

  alias_method :stagnant_rank?, :rank_stagnant?

  include SlugExtension

  searchable do
    text :title
  end

  rails_admin do
    list do
      field :id
      field :number
      field :title
      field :units
      field :value
      field :rank
    end
  end


  # private

    def current_snapshot
      return empty_snapshot if self.snapshots.empty?
      self.snapshots.order('date DESC').limit(1).first
    end

    def snapshot_in(year=DEFAULT_YEAR)
      return empty_snapshot if self.snapshots.empty?
      date = DateTime.new(year.to_i)
      snapshot = self.snapshots.where('date BETWEEN ? AND ?', date.beginning_of_year, date.end_of_year).order('date DESC').first
      snapshot ||= self.snapshots.order('date DESC').last
    end

    def empty_snapshot
      # lets other methods call .value and .rank without errors
      OpenStruct.new(value: nil, rank: nil)
    end


end
