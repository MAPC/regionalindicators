class AddObjectiveIDtoIndicators < ActiveRecord::Migration
  def up
    add_column :indicators, :objective_id, :integer
  end

  def down
    remove_column :indicators, :objective_id
  end
end
