class Subject < ActiveRecord::Base
  attr_accessible :slug, :title
  belongs_to :topic_area
  has_one :explanation, as: :explainable

end
