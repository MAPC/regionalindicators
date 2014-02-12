class AddCommunityTypeIdFieldToMunicipality < ActiveRecord::Migration
  def change
  	add_column :municipalities, :community_type_id, :integer
  end
end
