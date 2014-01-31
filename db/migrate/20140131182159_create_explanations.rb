class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.text :narrative
      t.references :explainable, polymorphic: true

      t.timestamps
    end
  end
end
