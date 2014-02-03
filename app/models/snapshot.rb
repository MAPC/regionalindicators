class Snapshot < ActiveRecord::Base
  attr_accessible :date, :rank, :value
  belongs_to :indicator

  validates :value, presence: true
  validates_datetime :date
end