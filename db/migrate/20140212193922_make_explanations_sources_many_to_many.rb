class MakeExplanationsSourcesManyToMany < ActiveRecord::Migration

  def up
    create_table :explanations_sources do |t|
      t.belongs_to :explanation
      t.belongs_to :source
    end
    remove_column :sources, :explanation_id
  end


  def down
    add_column :sources, :explanation_id, :integer
    drop_table :explanations_sources
  end

end
