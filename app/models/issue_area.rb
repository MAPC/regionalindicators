class IssueArea < ActiveRecord::Base
  attr_accessible :css_class,
                  :datacommon_url,
                  :icon,
                  :slug,
                  :title
  belongs_to :taggable, polymorphic: true

  DATACOMMON_REGEX = /metrobostondatacommon.org/

  validates :title, presence: true, length: { maximum: 35, minimum: 8 }
  validates :icon, presence: true
  validates :slug, presence: true, length: { maximum: 30, minimum: 8 }
  validates :datacommon_url, presence: true, format: { with: DATACOMMON_REGEX }

end
