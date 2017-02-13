class Indicator < ActiveRecord::Base
  attr_accessible :title,
                  :number,
                  :units,
                  :snapshot_ids,
                  :subject_id,
                  :issue_area_ids,
                  :id,
                  :objective_id,
                  :threshhold,
                  :explanation_id,
                  :higher_value_is_better,
                  :lower_rank_is_better,
                  :explanation_ids,
                  :visible,
                  :position,
                  :explanation

  attr_accessor :current_snapshot

  belongs_to :objective
  belongs_to :subject
  belongs_to :indicator_group
  
  has_one  :explanation, as: :explainable
  has_many :snapshots
  has_and_belongs_to_many :issue_areas, uniq: true
  
  accepts_nested_attributes_for :explanation

  validates :title,  presence: true, length: { maximum: 160, minimum: 8 }
  validates :number, presence: true
  validates :units,  presence: true, length: { maximum: 140 }

  self.primary_key = :id 

  default_scope { where(visible: true).includes(:explanation).includes(:snapshots).order('position ASC')  }

  # scope :with_position, -> {  }

  def goal
    objective.goal unless objective.nil?
  end


  def has_group?
    !self.indicator_group.nil?
  end

  def first_in_group?
    self == group.first
  end

  def last_in_group?
    self == group.last
  end

  def has_explanations?
    !self.explanation
  end

  def has_group_explanations?
    !self.indicator_group.explanations.empty?
  end

  def group_title
    group.title
  end

  def group_slug
    group.slug
  end


  def pass_fail
    return :non_recorded if threshhold.nil?
    status = ( value > threshhold )
    if higher_value_is_better
      status ? :pass : :fail
    else
      status ? :fail : :pass
    end
  end

  def direction
    return :static if ( value_delta.nil? || value_delta == 0 )
    value_delta > 0 ? :improving : :declining
  end

  def rank_position
    case rank
    when 1..10
      lower_rank_is_better ? :pass : :fail
    when 11..15
      :stagnant
    when 16..25
      lower_rank_is_better ? :fail : :pass
    end
  end

  def trend # TODO: make it reflect the value judgement
    return :stagnant if ( value_delta.nil? || value_delta == 0 )
    status = ( value_delta > 0 )
    if higher_value_is_better
      status ? :improving : :declining
    else
      status ? :declining : :improving
    end
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
    !current_snapshot.rank.nil? && current_snapshot.rank != 0
  end

  def value_in(year=DEFAULT_YEAR)
    snapshot_in(year).value
  end

  def rank_in(year=DEFAULT_YEAR)
    snapshot_in(year).rank
  end
  
  def snapshot_since(year=DEFAULT_YEAR)
    date = DateTime.new(year.to_i)
    self.snapshots.in_year(year).first
  end

  def update_value_delta(year=DEFAULT_YEAR)
    self.update_attribute(:value_delta, ( current_value - value_in(year) ) || 0)
  end

  def update_rank_delta(year=DEFAULT_YEAR)
    if current_rank
      self.update_attribute(:rank_delta, ( current_rank - rank_in(year) )    || 0)
    else
      self.update_attribute(:rank_delta, 0)
    end
  end

  alias_method :value, :current_value
  alias_method :rank,  :current_rank
  alias_method :rank?, :current_rank?

  alias_method :group,    :indicator_group
  alias_method :grouped?, :has_group?

  include SlugExtension

  # searchable do
  #   text :title
  # end

  rails_admin do
    list do
      field :id
      field :number
      field :title
      field :units
      field :value
      field :rank
      field :visible
      field :explanation
      field :position
    end
  end


  # private

  def current_snapshot
    @current_snapshot ||= (self.snapshots.first || EMPTY_SNAPSHOT)
  end

  def snapshot_in(year=DEFAULT_YEAR)
    date = DateTime.new(year.to_i)
    (self.snapshots.in_year(year).first || self.snapshots.last) || EMPTY_SNAPSHOT
  end

  def year_of_current_snapshot(year=DEFAULT_YEAR)
    snapshot = current_snapshot
    snapshot.date.year unless snapshot.date.nil?
  end

  def year_of_last_snapshot(year=DEFAULT_YEAR)
    snapshot = snapshot_in(year)
    snapshot.date.year unless snapshot.date.nil?
  end

  # Allows sending of #value and #rank without NoMethodErrors
  EMPTY_SNAPSHOT = OpenStruct.new(value: nil, rank: nil, date: nil)

end
