class Visualization < ActiveRecord::Base
  attr_accessible :title, :d3, :data, :delete_file
  attr_accessor :delete_file
  
  belongs_to :explanation

  has_attached_file :d3,   url: "/viz/:basename.:extension"
  has_attached_file :data, url: "/viz/data/:basename.:extension"
  
  before_validation { self.file.clear if self.delete_file == '1' }
  
  validates :title, presence: true, length: { maximum: 200, minimum: 4 }

  validates_attachment :d3#,   content_type: { content_type: [/\A.*\/.*javascript\z/, 'text/html'] }
  validates_attachment :data, content_type: { content_type: ['text/csv'] }

  def slug
    exp = self.explanation.explainable
    "#{exp.class.name.downcase}-#{exp.id}"
  end

  rails_admin do
    list do
      field :id
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