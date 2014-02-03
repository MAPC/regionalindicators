class Source < ActiveRecord::Base
  attr_accessible :author, :comment, :date, :title, :url
  belongs_to :explanation

  validates :title, presence: true, length: { maximum: 200, minimum: 5 }
  validates :author, presence: true, length: { maximum: 140, minimum: 5 }
end
