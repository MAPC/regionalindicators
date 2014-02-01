class Indicator < ActiveRecord::Base
  attr_accessible :title, :units, :number

  belongs_to :objective

  has_one :explanation, as: :explainable
  has_many :snapshots
  has_many :issue_areas, as: :taggable


  def value_in(year=2000)
  end

  def rank_in(year=2000)
  end

  def current_value
  end

  def earliest_value
  end

  def current_value
  end

  def earliest_value
  end

  def value_in_2000_at_earliest
  end

  def value_delta(since=2000)
  end

  def rank_delta(since=2000)
  end

end
