class AddSubjectOrderId < ActiveRecord::Migration
  def change
    add_column :subjects, :sort_order, :integer
  end
end
