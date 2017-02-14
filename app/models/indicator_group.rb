class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title, :indicators, :indicator_ids, :explanation_ids, :explanation_attributes, :position
  has_many :indicators, order: "position ASC"
  has_one :explanation, as: :explainable

  default_scope { 
    order(:position) 
  }

  validates :title, presence: true

  accepts_nested_attributes_for :explanation

  def first
    self.indicators.min_by{ |x| 
      if x.position != 0
        x.position
      else
        x.id
      end
    }
  end

  def last

    self.indicators.max_by{ |x| 
      if x.position != 0
        x.position
      else
        x.id
      end
    }

  end

  include SlugExtension

  # rails_admin do
  #   list do
  #     field :title 
  #     field :indicator_ids 
  #     field :explanation_ids 
  #     field :explanation_attributes 
  #     field :position
  #   end
  # end
end







