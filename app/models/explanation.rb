class Explanation < ActiveRecord::Base
  attr_accessible :narrative,
                  :source_ids,
                  :explainable_id,
                  :explainable_type,
                  :visualization_attributes,
                  :visualization_id

  belongs_to :explainable, polymorphic: true

  has_many :sources
  has_one :visualization

  accepts_nested_attributes_for :visualization

  validates :narrative, length: { maximum: 1500 }

  def narrative_html
    BlueCloth.new( narrative ).to_html.html_safe
  end

end
