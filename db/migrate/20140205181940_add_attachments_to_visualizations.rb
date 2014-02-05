class AddAttachmentsToVisualizations < ActiveRecord::Migration
  def up
  	add_attachment :visualizations, :file
  end

  def down
  	remove_attachment :visualizations, :file
  end
end
