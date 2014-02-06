class AddObjectiveIDtoIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :objective_id, :integer
  end
end
