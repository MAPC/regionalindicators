class AddYearRangeColumn < ActiveRecord::Migration
  def change
    add_column :snapshots, :year_range, :string
  end
end
