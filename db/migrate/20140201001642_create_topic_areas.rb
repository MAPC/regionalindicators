class CreateTopicAreas < ActiveRecord::Migration
  def change
    create_table :topic_areas do |t|
      t.string :abbr
      t.string :title

      t.timestamps
    end
  end
end
