class AddPositionToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :position, :integer, default: 0
  end
end
