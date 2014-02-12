class Municipality < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :subregions
  belongs_to :community_type
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }

end