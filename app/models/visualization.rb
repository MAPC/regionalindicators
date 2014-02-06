class Visualization < ActiveRecord::Base
  attr_accessible :title, :file
  attr_accessor :delete_file
  belongs_to :explanation

  validates :title, presence: true, length: { maximum: 200, minimum: 4 }

  has_attached_file :file,
           					storage: :s3,
        				    s3_credentials: {
          						bucket:            ENV['S3_BUCKET_NAME'],
          						access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
          						secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        				    },
        				    path: "resources/:id/:style/:basename.:extension",
        				    default_url: "/assets/missing-resource.png",
          					styles: { small: ['400x300>', :jpg] }

  before_validation { self.file.clear if self.delete_file == '1' }

  validates_attachment :file, content_type: { content_type: /\Aimage\/.*\Z/ }
 
end