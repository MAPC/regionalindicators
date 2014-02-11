class RemoveSubregionIdFromMunicipalities < ActiveRecord::Migration
  def up
  	remove_column :municipalities, :subregion_id
  end

  def down
  end
end