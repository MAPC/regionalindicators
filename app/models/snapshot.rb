class Snapshot < ActiveRecord::Base
  attr_accessible :date, :rank, :value,
                  :indicator_id
  
  belongs_to :indicator

  validates :value, presence: true
  validates_datetime :date
end