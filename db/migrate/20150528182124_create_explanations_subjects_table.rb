class CreateExplanationsSubjectsTable < ActiveRecord::Migration
  def up
    create_table :explanations_subjects, id: false do |t|
      t.references :explanation
      t.references :subject
    end
  end

  def down
    drop_table :explanations_subjects
  end
end
