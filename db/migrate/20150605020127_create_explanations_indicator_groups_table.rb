class CreateExplanationsIndicatorGroupsTable < ActiveRecord::Migration
  def up
    create_table :explanations_indicator_groups, id: false do |t|
      t.references :explanation
      t.references :indicator_groups
    end
  end

  def down
    drop_table :explanations_indicator_groups
  end
end
