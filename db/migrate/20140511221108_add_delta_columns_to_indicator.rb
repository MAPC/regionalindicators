class AddDeltaColumnsToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :value_delta, :float
    add_column :indicators, :rank_delta, :integer
  end
end
