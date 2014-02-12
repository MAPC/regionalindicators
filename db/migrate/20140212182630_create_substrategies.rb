class CreateSubstrategies < ActiveRecord::Migration
  def change
  	create_table :substrategies do |t|
      t.string :name
      t.string :letter
      t.integer :strategy_id

      t.timestamps
  	end    	
  end
end
