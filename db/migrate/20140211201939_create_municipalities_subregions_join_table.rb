class CreateMunicipalitiesSubregionsJoinTable < ActiveRecord::Migration
	def change
  	create_table :subregions_municipalities do |t|
      t.string :subregion
      t.string :municipality

      t.timestamps
  	end
  end
end
