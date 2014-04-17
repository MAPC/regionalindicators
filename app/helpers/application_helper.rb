module ApplicationHelper

  LIMIT = 63

  def topic_areas_options
    render partial: 'shared/list_item', collection: TopicArea.visible
  end

  def issue_area_icons
    render partial: 'issue_areas/issue_area', collection: IssueArea.ordered
  end

  def navbar_items
    render partial: 'shared/nav_item', collection: StaticPage.navbar
  end


  def scrollspy_item(text)
    text.length > LIMIT ? text[0..LIMIT].split(" ")[0..-2].join(' ') << '...' : text
  end
  

end
