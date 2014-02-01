class AddSubtitleToTopicArea < ActiveRecord::Migration
  def change
    add_column :topic_areas, :subtitle, :string
  end
end
