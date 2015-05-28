class CreateExplanationsIndicatorsTable < ActiveRecord::Migration
  def up
    create_table :explanations_indicators, id: false do |t|
      t.references :explanation
      t.references :indicator
    end
  end

  def down
    drop_table :explanations_indicators
  end
end
