class AddUnitsToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :units, :string
  end
end
