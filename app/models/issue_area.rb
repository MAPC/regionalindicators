class IssueArea < ActiveRecord::Base
  attr_accessible :datacommon_url,
                  :icon,
                  :title

  belongs_to :taggable, polymorphic: true

  DATACOMMON_REGEX = /metrobostondatacommon.org/

  validates :title, presence: true, length: { maximum: 35, minimum: 6 }
  validates :icon, presence: true
  validates :datacommon_url, presence: true, format: { with: DATACOMMON_REGEX }

  include SlugExtension
  alias_method :css_class, :slug

  rails_admin do
    list do
      field :id
      field :title
      field :icon
    end
  end

end