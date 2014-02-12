class RemoveAddColumn < ActiveRecord::Migration
  def up
  	remove_column :substrategies, :letter
  	add_column :substrategies, :abbr, :string
  end

  def down
  end
end
