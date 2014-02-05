class Subject < ActiveRecord::Base
  attr_accessible :title
  belongs_to :topic_area

  has_many :indicators
  has_one :explanation, as: :explainable

  validates :title, presence: true, length: { maximum: 100, minimum: 8 }

  include SlugExtension
  
end
