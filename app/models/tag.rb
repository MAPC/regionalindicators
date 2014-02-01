class Tag < ActiveRecord::Base
  attr_accessible :color, :css_class, :icon, :slug, :title
  belongs_to :taggable, polymorphic: true
end
