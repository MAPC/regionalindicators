class AddOrderToIssueAreas < ActiveRecord::Migration
  def change
    add_column :issue_areas, :sort_order, :integer
  end
end
