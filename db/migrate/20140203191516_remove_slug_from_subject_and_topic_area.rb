class RemoveSlugFromSubjectAndTopicArea < ActiveRecord::Migration
  def change
    remove_column :subjects, :slug
  end
end
