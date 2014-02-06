class CreateVisualizations < ActiveRecord::Migration
   def change
    create_table :visualizations do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
