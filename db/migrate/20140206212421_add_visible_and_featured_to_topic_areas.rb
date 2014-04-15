class AddVisibleAndFeaturedToTopicAreas < ActiveRecord::Migration
  def change
    add_column :topic_areas, :visible,  :boolean, default: false
    add_column :topic_areas, :featured, :boolean, default: false
  end
end
