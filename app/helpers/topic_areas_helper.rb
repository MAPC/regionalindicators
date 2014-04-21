module TopicAreasHelper

  # content_tag(:span, nil, class: "glyphicon glyphicon-#{icon}")

  # success: '',
  # failure: '',
  # neutral: ''

  # "alert-#{status}".html_safe

  

  @@thumbs =    { improving: 'thumbs-up',
                  declining: 'thumbs-down',
                  passing:   'thumbs-up',
                  failing:   'thumbs-down',
                  stagnant:  ''      }

  @@chevrons =  { improving: 'chevron-up',
                  declining: 'chevron-down',
                  passing:   'chevron-up',
                  failing:   'chevron-down',
                  stagnant:  'minus'      }

  @@alerts =    { improving: 'success',
                  declining: 'danger',
                  passing:   'success',
                  failing:   'danger',
                  stagnant:  'info'       }


  def alert_class(indicator, property)
    value = indicator.send(property.to_sym) || :stagnant
    "alert-#{ @@alerts[value] }".html_safe
  end

  def chevron_class(indicator, property)
    value = indicator.send(property.to_sym) || :stagnant
    content_tag(:span, nil, class: "glyphicon glyphicon-#{ @@chevrons[value] }")
  end

  def thumb_class(indicator, property)
    value = indicator.send(property.to_sym) || :stagnant
    content_tag(:span, nil, class: "glyphicon glyphicon-#{ @@thumbs[value] }")
  end

end