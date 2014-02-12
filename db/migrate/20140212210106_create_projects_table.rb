class CreateProjectsTable < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
      t.string :name
	    t.integer :department_id
      t.integer :fundingsource_id 

      t.timestamps
  	end   
  end
end
