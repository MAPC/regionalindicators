class Explanation < ActiveRecord::Base
  attr_accessible :narrative,
                  :source_ids,
                  :explainable_id,
                  :explainable_type,
                  :visualization_attributes,
                  :visualization_id

  belongs_to :explainable, polymorphic: true

  has_and_belongs_to_many :sources
  has_one :visualization

  accepts_nested_attributes_for :visualization, reject_if: lambda { |v| v[:title].blank? && v[:file_file_name].blank? }

  validates :narrative, length: { maximum: 6000 }

  def has_sources?
    self.sources.length > 0
  end

  def has_visualization?
    self.visualization
  end

  def narrative_html
    BlueCloth.new( narrative ).to_html.html_safe
  end

  rails_admin do
    list do
      field :id
      field :narrative
      field :explainable_type do
        label "for"
      end
      field :explainable do
        label "What's being explained:"
      end
      field :explainable_id do
        label "Explaining ID#"
      end
    end
  end

end
