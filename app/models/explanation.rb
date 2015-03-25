class Explanation < ActiveRecord::Base
  attr_accessible :narrative,
                  :source_ids,
                  :explainable_id,
                  :explainable_type,
                  :visualization_attributes,
                  :visualization_id

  belongs_to :explainable, polymorphic: true

  has_and_belongs_to_many :sources
  has_many :visualizations

  accepts_nested_attributes_for :visualizations, reject_if: lambda { |viz| viz[:title].blank? && viz[:d3_file_name].blank? }

  validates :narrative, length: { maximum: 6000 }

  default_scope { includes(:visualizations).includes(:sources) }

  def has_sources?
    self.sources.length > 0
  end

  def has_visualizations?
    !self.visualizations.empty?
  end

  def narrative_html
    narrative.html_safe
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
