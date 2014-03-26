class Visualization < ActiveRecord::Base
  attr_accessible :title, :file, :delete_file
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
                    default_url: "/404.html",
                    styles: lambda { |a|
                                  if a.instance.is_image?
                                    { small: ['400x300>', :jpg] }
                                  else
                                    {}
                                  end
                            }

  before_validation { self.file.clear if self.delete_file == '1' }

  validates_attachment :file, content_type: { content_type: [/\Aimage\/.*\Z/, 'text/html'] }

  def is_image?
    # return false unless file.content_type
    ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg'].include?(file.content_type)
  end

  rails_admin do
    list do
      field :id
      field :file
      field :updated_at do
        pretty_value do
          value.strftime("%-d %b %Y %H:%M")
        end
      end 
    end
  end
 
end