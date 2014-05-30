class AddIndicesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :explanations_sources, [:explanation_id, :source_id]
    add_index :indicators_issue_areas, [:indicator_id, :issue_area_id]

    
    add_index :goals,      :topic_area_id
    add_index :indicators, :indicator_group_id
    add_index :indicators, :objective_id
    add_index :indicators, :subject_id
    add_index :objectives, :goal_id
    add_index :snapshots,  :indicator_id
    add_index :subjects,   :topic_area_id

    add_index :visualizations, :explanation_id
  end
end
