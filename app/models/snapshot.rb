class Snapshot < ActiveRecord::Base
  attr_accessible :date, :rank, :units, :value
end
