module ApplicationHelper

  LIMIT = 63

  def topic_area_pages
    render partial: 'shared/list_item', collection: TopicArea.visible
  end

  def topic_area_dashboards
    render partial: 'shared/dashboard_item', collection: TopicArea.visible
  end

  def issue_area_icons
    render partial: 'issue_areas/issue_area', collection: IssueArea.ordered
  end

  def navbar_items
    render partial: 'shared/nav_item', collection: StaticPage.navbar
  end

  def issue_area_list
    render partial: 'issue_areas/issue_area_list', collection: IssueArea.order('title ASC')
  end
  # Limits scrollspy menu items > LIMIT chars long
  # and appends an ellipsis if it's too long
  def scrollspy_item(text)
    text.length > LIMIT ? text[0..LIMIT].split(" ")[0..-2].join(' ') << '...' : text
  end


  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  

end
