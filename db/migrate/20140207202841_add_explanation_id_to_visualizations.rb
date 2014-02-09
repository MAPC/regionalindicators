class AddExplanationIdToVisualizations < ActiveRecord::Migration
  def change
    add_column :visualizations, :explanation_id, :integer
  end
end
