class Municipality < ActiveRecord::Base
  attr_accessible :name, :abbr

  has_and_belongs_to_many :subregions
  has_one :community_type
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  # validates :abbr, presence: true, length: { maximum: 10, minimum: 2 }
  
  # scope :by_name_asc, lambda { order("name ASC") }

end