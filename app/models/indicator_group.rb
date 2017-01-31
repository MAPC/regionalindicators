class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title, :indicator_ids, :explanation_ids, :explanation_attributes
  has_many :indicators
  has_one :explanation, as: :explainable

  default_scope { order(:id).order(:position)  }

  validates :title, presence: true

  accepts_nested_attributes_for :explanation

  def first
    self.indicators.min_by{ |i| i.id }
  end

  def last
    self.indicators.max_by{ |i| i.id }
  end

  include SlugExtension

end
