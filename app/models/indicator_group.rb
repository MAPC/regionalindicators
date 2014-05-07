class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title
  has_many :indicators

  validates :title, presence: true

  def first
    self.indicators.min_by{ |i| i.id }
  end

  def last
    self.indicators.max_by{ |i| i.id }
  end

  include SlugExtension
  
end
