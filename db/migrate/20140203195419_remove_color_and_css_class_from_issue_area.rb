class RemoveColorAndCssClassFromIssueArea < ActiveRecord::Migration
  def change
    remove_column :issue_areas, :color
    remove_column :issue_areas, :css_class
  end
end
