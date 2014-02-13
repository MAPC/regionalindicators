class DropTables < ActiveRecord::Migration
  def up
  	drop_table :municipalities
  	drop_table :subregions
  end

  def down
  end
end
