class AddIndicatorGroupIdToExplanationsRemoveWrongColNameOnce < ActiveRecord::Migration
  def change
    rename_column :explanations_indicator_groups, :indicator_group, :indicator_group_id
  end
end
