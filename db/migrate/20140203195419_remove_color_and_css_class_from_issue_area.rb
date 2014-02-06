class RemoveColorAndCssClassFromIssueArea < ActiveRecord::Migration
  def up
    remove_column :issue_areas, :color
    remove_column :issue_areas, :css_class
  end

  def down
    add_column :issue_areas, :color, :string
    add_column :issue_areas, :css_class, :string
  end
end
