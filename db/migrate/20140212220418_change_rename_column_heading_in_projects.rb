class ChangeRenameColumnHeadingInProjects < ActiveRecord::Migration
  def up
  	remove_column :projects, :fundingsource_id
  	add_column :projects, :funding_source_id, :integer
  end

  def down
  end
end
