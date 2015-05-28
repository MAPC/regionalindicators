class AddUniquenessIndices < ActiveRecord::Migration
  def up
    remove_index :indicators_issue_areas, [:indicator_id, :issue_area_id]
    add_index    :indicators_issue_areas, [:indicator_id, :issue_area_id], unique: true, name: 'index_indicators_issue_areas_on_indicator_id_and_issue_area_id'
  end

  def down
    remove_index :indicators_issue_areas, [:indicator_id, :issue_area_id]
    add_index    :indicators_issue_areas, [:indicator_id, :issue_area_id]
  end
end
