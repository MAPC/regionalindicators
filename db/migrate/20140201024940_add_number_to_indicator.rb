class AddNumberToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :number, :integer
  end
end
