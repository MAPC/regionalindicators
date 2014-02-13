class Project < ActiveRecord::Base
  attr_accessible :name
  belongs_to :department
  belongs_to :funding_source

  validates :name, presence: true, length: { maximum: 140, minimum: 3 }

end
