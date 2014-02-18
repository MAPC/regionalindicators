class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title
      t.text :content
      t.string :slug_id
      t.boolean :top
      t.integer :sort_order

      t.timestamps
    end
  end
end
