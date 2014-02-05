class ChangeVisualizationsUrlToFile < ActiveRecord::Migration
  def up
  	remove_column :visualizations, :url
  	add_column :visualizations, :file, :string
  end

  def down
  end
end
