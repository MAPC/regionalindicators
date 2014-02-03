class Source < ActiveRecord::Base
  attr_accessible :author, :comment, :date, :title, :url
  belongs_to :explanation

  validates :title, presence: true, length: { maximum: 200, minimum: 8 }
  validates :author, presence: true, length: { maximum: 140, minimum: 8 }
  validates_datetime :date
end
