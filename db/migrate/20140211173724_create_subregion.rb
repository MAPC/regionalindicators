class CreateSubregion < ActiveRecord::Migration
  def change
  	create_table :subregions do |t|
      t.string :abbr
      t.string :name

      t.timestamps
  	end
  end
end
