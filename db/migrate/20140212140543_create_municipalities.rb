class CreateMunicipalities < ActiveRecord::Migration
  def up
  	create_table :municipalities do |t|
      t.integer :muni_id
      t.string :name
      t.belongs_to :community_types

      t.timestamps
  	end
  end

  def down
  end
end
