class TopicArea < ActiveRecord::Base
  attr_accessible :abbr, :title, :subtitle
  has_many :goals
  has_many :subjects
end
