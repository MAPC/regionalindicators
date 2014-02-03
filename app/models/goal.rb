class Goal < ActiveRecord::Base
  attr_accessible :number, :slug, :title
  belongs_to :topic_area
  has_many :objectives

  validates :title, presence: true, length: { maximum: 255, minimum: 8 }
  validates :number, presence: true
  validates :slug, presence: true, length: { maximum: 30, minimum: 8 }

end
