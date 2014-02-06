class AddExplanationIdToTopicAreas < ActiveRecord::Migration
  def change
    add_column :topic_areas, :explanation_id, :integer
  end
end
