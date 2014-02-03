class Explanation < ActiveRecord::Base
  attr_accessible :narrative
  belongs_to :explainable, polymorphic: true
  has_many   :sources

  validates :narrative, length: { maximum: 1500 }

  def narrative_html
    BlueCloth.new( narrative ).to_html
  end

end
