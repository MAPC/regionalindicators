class RemoveSubjectAreaIdFromSubjects < ActiveRecord::Migration
  def up
    remove_column :subjects, :subject_area_id
  end

  def down
    add_column :subjects, :subject_area_id, :integer
  end
end
