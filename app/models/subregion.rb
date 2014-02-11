class Subregion < ActiveRecord::Base
  attr_accessible :name, :abbr

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :abbr, presence: true, length: { maximum: 10, minimum: 2 }
  
  has_and_belongs_to_many :municipalities

  scope :by_name_asc, lambda { order("name ASC") }

end