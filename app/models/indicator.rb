class Indicator < ActiveRecord::Base
  attr_accessible :title
  has_one :explanation, as: :explainable
end
