class AddDashboardFramingToTopicAreas < ActiveRecord::Migration
  def change
    add_column :topic_areas, :dashboard_framing, :text
  end
end
