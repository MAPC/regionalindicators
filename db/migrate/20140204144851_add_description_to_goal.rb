class AddDescriptionToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :description, :string
    remove_column :goals, :slug
  end
end
