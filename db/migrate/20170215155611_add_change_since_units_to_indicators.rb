class AddChangeSinceUnitsToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :change_since_units, :string
  end
end