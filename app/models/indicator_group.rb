class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title, :indicator_ids
  has_many :indicators
  has_one :explanation, as: :explainable

  validates :title, presence: true

  def first
    self.indicators.min_by{ |i| i.id }
  end

  def last
    self.indicators.max_by{ |i| i.id }
  end

  include SlugExtension
  
end
