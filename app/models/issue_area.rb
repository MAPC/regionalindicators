class IssueArea < ActiveRecord::Base
  attr_accessible :datacommon_url,
                  :icon,
                  :title,
                  :sort_order
  belongs_to :taggable, polymorphic: true

  DATACOMMON_REGEX = /metrobostondatacommon.org/

  validates :title, presence: true, length: { maximum: 35, minimum: 6 }
  validates :icon, presence: true
  validates :datacommon_url, presence: true, format: { with: DATACOMMON_REGEX }

  scope :ordered, where('sort_order IS NOT NULL').order('sort_order')

  include SlugExtension
  alias_method :css_class, :slug

  rails_admin do
    list do
      field :id
      field :title
      field :icon
      field :sort_order
    end
  end

end
