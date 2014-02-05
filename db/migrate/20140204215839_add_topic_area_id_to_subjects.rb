class AddTopicAreaIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :topic_area_id, :integer
  end
end
