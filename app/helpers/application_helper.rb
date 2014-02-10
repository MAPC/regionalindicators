module ApplicationHelper

  def topic_areas_options
    render partial: 'shared/list_item', collection: TopicArea.visible
  end

  def issue_area_icons
    render partial: 'shared/issue_area', collection: IssueArea.order('title')
  end

end
