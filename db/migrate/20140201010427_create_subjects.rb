class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :slug
      t.references :subject_area

      t.timestamps
    end
  end
end
