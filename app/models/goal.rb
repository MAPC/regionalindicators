class Goal < ActiveRecord::Base
  attr_accessible :number, :slug, :title
  belongs_to :topic_area
  has_many :objectives
end
