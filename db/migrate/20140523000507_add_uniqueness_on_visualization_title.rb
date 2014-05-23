class AddUniquenessOnVisualizationTitle < ActiveRecord::Migration
  def change
    add_index :visualizations, [:title, :explanation_id], unique: true
  end
end
