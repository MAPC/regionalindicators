class AddSubjectIdToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :subject_id, :integer
  end
end
