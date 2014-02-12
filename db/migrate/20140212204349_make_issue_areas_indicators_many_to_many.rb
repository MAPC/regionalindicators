class MakeIssueAreasIndicatorsManyToMany < ActiveRecord::Migration
  
  def up
    create_table :indicators_issue_areas do |t|
      t.belongs_to :indicator
      t.belongs_to :issue_area
    end

    remove_column :issue_areas, :taggable_id
    remove_column :issue_areas, :taggable_type
  end


  def down
    drop_table :indicators_issue_areas

    add_column :issue_areas, :taggable_id, :integer
    add_column :issue_areas, :taggable_type, :string
  end

end
