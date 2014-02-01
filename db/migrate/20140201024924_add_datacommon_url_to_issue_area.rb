class AddDatacommonUrlToIssueArea < ActiveRecord::Migration
  def change
    add_column :issue_areas, :datacommon_url, :string
  end
end
