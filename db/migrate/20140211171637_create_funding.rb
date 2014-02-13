class CreateFunding < ActiveRecord::Migration
  def change
  	create_table :funding_sources do |t|
      t.string :name

      t.timestamps
  	end
  end
end
