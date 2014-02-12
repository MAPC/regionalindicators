class CreateMunicipalitiesAndSubregionsTable < ActiveRecord::Migration
  def up
  	create_table :subregions do |t|
     	t.string :abbr
      t.string :name

      t.timestamps
  	end

  	create_table :municipalities do |t|
      t.integer :muni_id
      t.string :name
      t.belongs_to :subregion

      t.timestamps
  	end


  end

  def down
    drop_table :subregions
    drop_table :municipalities
  end
end
