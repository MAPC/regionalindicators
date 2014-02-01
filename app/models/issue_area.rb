class IssueArea < ActiveRecord::Base
  attr_accessible :color,
                  :css_class,
                  :datacommon_url,
                  :icon,
                  :slug,
                  :title
  belongs_to :taggable, polymorphic: true
end
