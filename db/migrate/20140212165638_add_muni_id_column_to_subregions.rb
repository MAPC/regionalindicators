class AddMuniIdColumnToSubregions < ActiveRecord::Migration
  def change
  	add_column :subregions, :muni_id, :integer
  end
end
