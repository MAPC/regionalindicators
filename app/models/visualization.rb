class Visualization < ActiveRecord::Base
  attr_accessible :title, :url
  belongs_to :explanation

  validates :title, presence: true, length: { maximum: 200, minimum: 4 }
  validates :url, presence: true
end
