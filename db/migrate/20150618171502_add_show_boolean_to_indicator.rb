class AddShowBooleanToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :visible,  :boolean, default: true
  end
end
