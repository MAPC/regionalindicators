class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :number
      t.string :title
      t.string :slug
      t.references :topic_area

      t.timestamps
    end
  end
end
