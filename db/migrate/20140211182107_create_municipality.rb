class CreateMunicipality < ActiveRecord::Migration
  def change
  	create_table :municipalities do |t|
      t.integer :muni_id	
      t.string :name
      t.integer :community_type_id
      t.integer :subregion_id

      t.timestamps
  	end
  end
end
