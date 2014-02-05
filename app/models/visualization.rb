class Visualization < ActiveRecord::Base
  attr_accessible :title, :file
  belongs_to :explanation

  validates :title, presence: true, length: { maximum: 200, minimum: 4 }

  has_attached_file :file

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
 
end