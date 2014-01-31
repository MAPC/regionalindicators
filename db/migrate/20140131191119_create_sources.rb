class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.timestamp :date
      t.text :comment
      t.string :author
      t.integer :explanation_id

      t.timestamps
    end
  end
end
