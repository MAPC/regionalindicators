class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.text :narrative

      t.timestamps
    end
  end
end
