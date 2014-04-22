class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title
  has_many :indicators

  def first
    self.indicators.min_by{ |i| i.id }
  end

  def last
    self.indicators.max_by{ |i| i.id }
  end

  include SlugExtension
  
end
