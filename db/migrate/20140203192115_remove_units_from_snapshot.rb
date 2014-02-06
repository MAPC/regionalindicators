class RemoveUnitsFromSnapshot < ActiveRecord::Migration
  def up
    remove_column :snapshots, :units
  end

  def down
    remove_column :snapshots, :units, :string
  end
end
