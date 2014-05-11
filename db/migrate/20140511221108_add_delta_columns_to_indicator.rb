class AddDeltaColumnsToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :value_delta, :integer
    add_column :indicators, :rank_delta, :integer
  end
end
