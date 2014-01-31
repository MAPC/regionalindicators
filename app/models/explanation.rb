class Explanation < ActiveRecord::Base
  attr_accessible :narrative
  belongs_to :explainable, polymorphic: true
  has_many :sources

  def narrative_html
    BlueCloth.new( narrative ).to_html
  end

end
