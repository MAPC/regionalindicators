class RemoveUnitsFromSnapshot < ActiveRecord::Migration
  def change
    remove_column :snapshots, :units
  end
end
