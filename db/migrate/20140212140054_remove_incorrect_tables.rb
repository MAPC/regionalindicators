class RemoveIncorrectTables < ActiveRecord::Migration
  def up
  	drop_table :municipalities
  	drop_table :subregions
  end
end
