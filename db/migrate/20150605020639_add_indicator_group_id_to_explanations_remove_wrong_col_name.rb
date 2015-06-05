class AddIndicatorGroupIdToExplanationsRemoveWrongColName < ActiveRecord::Migration
  def change
    rename_column :explanations_indicator_groups, :indicator_groups_id, :indicator_group
  end
end
