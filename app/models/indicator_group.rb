class IndicatorGroup < ActiveRecord::Base
  attr_accessible :title, :indicator_ids, :explanation_ids, :explanation_attributes, :position
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
    # if position 
    #   self.indicators.min_by{ |i| i.position }
    # else
      
    # end
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

end
