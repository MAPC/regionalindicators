class Department < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }

end
