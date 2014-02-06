class RemoveSlugFromIssueArea < ActiveRecord::Migration
  def up
    remove_column :issue_areas, :slug
  end

  def down
    add_column :issue_areas, :slug, :string
  end
end
