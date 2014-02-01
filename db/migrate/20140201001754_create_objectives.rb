class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.integer :number
      t.string :title
      t.references :goal

      t.timestamps
    end
  end
end
