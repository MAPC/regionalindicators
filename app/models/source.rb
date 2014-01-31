class Source < ActiveRecord::Base
  attr_accessible :author, :comment, :date, :title, :url
  belongs_to :explanation
end
