class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title, :indicator_ids, :explanation_ids
  has_many :indicators
  has_and_belongs_to_many :explanations
  validates :title, presence: true

  def first
    self.indicators.min_by{ |i| i.id }
  end

  def last
    self.indicators.max_by{ |i| i.id }
  end

  include SlugExtension
end
