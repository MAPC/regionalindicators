class ChangeVisualizationPaperclipColumns < ActiveRecord::Migration

  def up
    remove_attachment :visualizations, :file
    add_attachment    :visualizations, :data
    add_attachment    :visualizations, :d3
  end

  def down
    add_attachment    :visualizations, :file
    remove_attachment :visualizations, :data
    remove_attachment :visualizations, :d3
  end
end