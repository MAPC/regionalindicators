class Indicator < ActiveRecord::Base
  attr_accessible :title, :units

  belongs_to :objective

  has_one :explanation, as: :explainable
  has_many :snapshots
  has_many :issue_areas, as: :taggable

  # def current_value
  # end

  # def earliest_value
  # end

  # def year_2000_or_earliest_value
  # end

  # def value_delta( since=2000 )
  # end

  # def rank_delta( since=2000 )
  # end

end
