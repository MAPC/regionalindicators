class CreateStrategiesTable < ActiveRecord::Migration
  def up
  	create_table :strategies do |t|
      t.integer :number
      t.string :name

      t.timestamps
  	end  	
  end

  def down
  end
end
