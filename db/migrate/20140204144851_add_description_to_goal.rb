class AddDescriptionToGoal < ActiveRecord::Migration
  def up
    add_column :goals, :description, :string
    remove_column :goals, :slug
  end

  def down
    remove_column :goals, :description
    add_column :goals, :slug, :string
  end
end
