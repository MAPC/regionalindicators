class AddVisibleAndFeaturedToTopicAreas < ActiveRecord::Migration
  def change
    add_column :topic_areas, :visible, :boolean
    add_column :topic_areas, :featured, :boolean
  end
end
