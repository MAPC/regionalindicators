class CreateIndicatorGroups < ActiveRecord::Migration
  def up
    create_table :indicator_groups do |t|
      t.string :title

      t.timestamps
    end

    add_column :indicators, :indicator_group_id, :integer
  end

  def down
    drop_table    :indicator_groups
    remove_column :indicators, :indicator_group_id
  end
end
