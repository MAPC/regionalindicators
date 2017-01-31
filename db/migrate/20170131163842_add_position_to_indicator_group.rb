class AddPositionToIndicatorGroup < ActiveRecord::Migration
  def change
    add_column :indicator_groups, :position, :integer, default: 0
  end
end
