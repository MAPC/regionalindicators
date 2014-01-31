class Explanation < ActiveRecord::Base
  attr_accessible :narrative
  belongs_to :explainable, polymorphic: true
end
