class AddRankableToTopicArea < ActiveRecord::Migration
  def change
    add_column :topic_areas, :rankable,  :boolean, default: true
  end
end
