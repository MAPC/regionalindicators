class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :title

      t.timestamps
    end
  end
end
