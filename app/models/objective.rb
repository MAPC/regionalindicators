class Objective < ActiveRecord::Base
  attr_accessible :number, :title
  belongs_to :goal
  has_many :indicators
end
