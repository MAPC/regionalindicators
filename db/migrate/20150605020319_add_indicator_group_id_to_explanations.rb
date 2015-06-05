class AddIndicatorGroupIdToExplanations < ActiveRecord::Migration
  def change
    add_column :explanations, :indicator_group_id, :integer
  end
end
