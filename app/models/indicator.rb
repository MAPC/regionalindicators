class Indicator < ActiveRecord::Base
  attr_accessible :title,
                  :number,
                  :units,
                  :snapshot_ids,
                  :subject_id,
                  :explanation_attributes

  belongs_to :objective
  belongs_to :subject

  has_one :explanation, as: :explainable
  has_many :snapshots
  has_many :issue_areas, as: :taggable

  accepts_nested_attributes_for :explanation

  validates :title, presence: true, length: { maximum: 160, minimum: 8 }
  validates :number, presence: true
  validates :units, presence: true, length: { maximum: 140 }

  DEFAULT_YEAR = 2000

  def current_value
    current_snapshot.value
  end

  def current_rank
    current_snapshot.rank
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
    current_value - value_in(year)
  end

  def rank_delta(year=DEFAULT_YEAR)
    (current_rank - rank_in(year)) * -1
  end

  alias_method :value, :current_value
  alias_method :rank,  :current_rank

  include SlugExtension


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


  private

    def current_snapshot
      return empty_snapshot if self.snapshots.empty?
      self.snapshots.order('date DESC').limit(1).first
    end

    def snapshot_in(year=DEFAULT_YEAR)
      return empty_snapshot if self.snapshots.empty?
      date = DateTime.new(year.to_i)
      self.snapshots.where('date BETWEEN ? AND ?', date.beginning_of_year, date.end_of_year).order('date DESC').first
    end

    def empty_snapshot
      # lets other methods call .value and .rank without errors
      OpenStruct.new(value: nil, rank: nil)
    end


end
