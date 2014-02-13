class Strategy < ActiveRecord::Base
  attr_accessible :number, :name

  has_many :substrategies

  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
  validates :number, presence: true

end