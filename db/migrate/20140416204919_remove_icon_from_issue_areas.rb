class RemoveIconFromIssueAreas < ActiveRecord::Migration
  def up
    remove_column :issue_areas, :icon
  end

  def down
    add_column :issue_areas, :icon, :string
  end
end
