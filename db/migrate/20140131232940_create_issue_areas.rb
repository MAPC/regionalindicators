class CreateIssueAreas < ActiveRecord::Migration
  def change
    create_table :issue_areas do |t|
      t.string :color
      t.string :css_class
      t.string :icon
      t.string :title
      t.string :slug
      t.references :taggable, polymorphic: true

      t.timestamps
    end
  end
end
