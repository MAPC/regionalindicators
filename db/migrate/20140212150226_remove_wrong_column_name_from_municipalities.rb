class RemoveWrongColumnNameFromMunicipalities < ActiveRecord::Migration
  def up
  	remove_column :municipalities, :community_types_id
  end

  def down
  end
end
