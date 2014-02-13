class CreateSubregions < ActiveRecord::Migration
  def up
  	create_table :subregions do |t|
      t.string :name
      t.string :abbr
      t.integer :muni_id

      t.timestamps
  	end  	
  end

  def down
  end
end