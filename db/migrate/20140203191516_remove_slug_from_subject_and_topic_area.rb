class RemoveSlugFromSubjectAndTopicArea < ActiveRecord::Migration
  def up
    remove_column :subjects, :slug
  end

  def down
    add_column :subjects, :slug, :string
  end
end
