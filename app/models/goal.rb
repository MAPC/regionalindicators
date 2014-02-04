class Goal < ActiveRecord::Base
  attr_accessible :number, :description, :title
  belongs_to :topic_area
  has_many :objectives

  validates :number, presence: true
  validates :description, presence: true, length: { maximum: 255, minimum: 8 }
  validates :title, presence: true, length: { maximum: 255, minimum: 8 }

  include SlugExtension

end
