class CreateCommunityType < ActiveRecord::Migration
  def change
  	create_table :community_types do |t|
      t.string :abbr
      t.string :name

      t.timestamps
  	end
  end
end
