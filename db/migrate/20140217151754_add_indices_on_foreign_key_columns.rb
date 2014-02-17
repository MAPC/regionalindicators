class AddIndicesOnForeignKeyColumns < ActiveRecord::Migration
  def up
  	add_index :municipalities, :community_type_id
  	add_index :projects, :department_id
  	add_index :projects, :funding_source_id
  	add_index :substrategies, :strategy_id
  end

  def down
  	remove_index :municipalities, :column => :community_type_id
	remove_index :projects, :column => :department_id
	remove_index :projects, :column => :funding_source_id
	remove_index :substrategies, :column => :strategy_id
  end
end
