class Objective < ActiveRecord::Base
  attr_accessible :number, :title
  belongs_to :goal
  has_many :indicators

  validates :title, presence: true, length: { maximum: 255, minimum: 8 }
  validates :number, presence: true
end
