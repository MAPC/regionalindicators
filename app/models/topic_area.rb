class TopicArea < ActiveRecord::Base
  attr_accessible :abbr, :title, :subtitle
  has_many :goals
  has_many :subjects

  validates :title, presence: true, length: { maximum: 100, minimum: 8 }
  validates :subtitle, allow_blank: true, length: { maximum: 140, minimum: 8 }

  include SlugExtension

end
