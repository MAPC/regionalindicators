class Indicator < ActiveRecord::Base
  attr_accessible :title, :number, :units

  belongs_to :objective

  has_one :explanation, as: :explainable
  has_many :snapshots
  has_many :issue_areas, as: :taggable

  validates :title, presence: true, length: { maximum: 160, minimum: 8 }
  validates :number, presence: true
  validates :units, presence: true, length: { maximum: 140 }

  def current_snapshot
    # self.snapshots.order_by('created_at').limit(1)
  end

  def snapshot_in(year=2000)
    # self.snapshots.find_by_date( Date.new(year) ).limit(1)
  end

  def current_value
    # current_snapshot.value
  end

  def value_in_2000_at_earliest
  end

  def value_delta
  end

end
