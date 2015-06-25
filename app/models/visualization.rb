class Visualization < ActiveRecord::Base
  attr_accessible :title, :d3, :data, :delete_file,
                  :d3_file_name,
                  :data_file_name,
                  :explainable_type,
                  :explainable_id,
                  :explanation_id

  attr_accessor :delete_file
  
  belongs_to :explanation

  has_attached_file :d3,   url: "/assets/d3/:basename.:extension",   preserve_files: true
  has_attached_file :data, url: "/assets/data/:basename.:extension", preserve_files: true
  
  before_validation { self.file.clear if self.delete_file == '1' }
  
  validates :title, presence: true, length: { maximum: 200, minimum: 4 }, uniqueness: { scope: :explanation_id }

  validates_attachment :d3#,   content_type: { content_type: [/\A.*\/.*javascript\z/, 'text/html'] }
  validates_attachment :data#, content_type: { content_type: ['text/csv','application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'] }

  default_scope { order(:id) }

  def slug
    exp = self.explanation.explainable
    "#{exp.class.name.downcase}-#{exp.id}"
  end

  def explainable_id
    explanation.explainable.id
  end

  def explainable_type
    explanation.explainable.class.name.downcase
  end

  def explainable_dom_id
    "#{explainable_type}-#{explainable_id}-#{id}"
  end

  rails_admin do
    list do
      field :id
      field :title
      field :d3
      field :data
      field :updated_at do
        pretty_value do
          value.strftime("%-d %b %Y %H:%M")
        end
      end
      field :explanation do
        read_only true
      end
    end
  end
 
end