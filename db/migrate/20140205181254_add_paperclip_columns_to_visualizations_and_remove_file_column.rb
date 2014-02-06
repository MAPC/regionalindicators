class AddPaperclipColumnsToVisualizationsAndRemoveFileColumn < ActiveRecord::Migration
  def change
  	remove_column :visualizations, :file
  end

  def up
  	add_attachment :visualizations, :file
  end

  def down
  	remove_attachment :visualizations, :file
  end
end
