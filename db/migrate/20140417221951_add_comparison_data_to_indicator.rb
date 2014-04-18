class AddComparisonDataToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :threshhold,             :decimal
    add_column :indicators, :higher_value_is_better, :boolean, default: true
    add_column :indicators, :lower_rank_is_better,   :boolean, default: true
  end
end
