class Explanation < ActiveRecord::Base
  attr_accessible :narrative
  belongs_to :explainable, polymorphic: true

  def narrative_html
    BlueCloth.new(narrative).to_html
  end

end
