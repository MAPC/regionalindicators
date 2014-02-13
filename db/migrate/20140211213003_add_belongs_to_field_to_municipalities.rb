class AddBelongsToFieldToMunicipalities < ActiveRecord::Migration
  def change
	remove_column :municipalities, :community_type_id
	change_table :municipalities do |t|
		t.belongs_to :community_type
  	end
  end
end
