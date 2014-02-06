class Explanation < ActiveRecord::Base
  attr_accessible :narrative, :source_ids, :explainable_id, :explainable_type
  belongs_to :explainable, polymorphic: true
  has_many   :sources

  validates :narrative, length: { maximum: 1500 }

  def narrative_html
    BlueCloth.new( narrative ).to_html.html_safe
  end

end
