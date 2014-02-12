class Substrategy < ActiveRecord::Base
  attr_accessible :name, :abbr
  
  belongs_to :strategy

  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
  validates :abbr, presence: true, length: { maximum: 1 }
  
end