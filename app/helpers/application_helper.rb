module ApplicationHelper

  def topic_areas_options
    render partial: 'shared/list_item', collection: TopicArea.visible
  end

  def issue_area_icons
    render partial: 'issue_areas/issue_area', collection: IssueArea.ordered
  end

end
