class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.timestamp :date
      t.float :value
      t.string :units
      t.integer :rank

      t.integer :indicator_id

      t.timestamps
    end
  end
end
