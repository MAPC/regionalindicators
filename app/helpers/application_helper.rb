module ApplicationHelper

  def dropdown_for_topic_areas
    options = TopicArea.visible.map {|ta| link_list_item ta }.join('')
    dropdown_content(options)
  end

  private

    def link_list_item(topic_area)
      "<li><a href='#{topic_area_path(topic_area)}'>#{topic_area.title}</a></li>"
    end

    def dropdown_content(options)
      str = <<-EOS
        <ul class="dropdown-menu">
          #{options}
        </ul>
      EOS
      str.html_safe
    end

end
