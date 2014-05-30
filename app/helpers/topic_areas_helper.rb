module TopicAreasHelper

  

  @@thumbs =    { improving: 'thumbs-up',
                  declining: 'thumbs-down',

                  pass:         'thumbs-up',
                  fail:         'thumbs-down',
                  non_recorded: '',
                  stagnant:     ''      }

  @@chevrons =  { improving: 'chevron-up',
                  declining: 'chevron-down',
                  passing:   'chevron-up',
                  failing:   'chevron-down',
                  stagnant:  'minus'      }

  @@alerts =    { improving:    'success',
                  declining:    'danger',
                  pass:         'success',
                  fail:         'danger',
                  non_recorded: 'info',
                  stagnant:     'info'       }


  def alert_class(indicator, property)
    value = indicator.send(property.to_sym) || :stagnant
    "#{ @@alerts[value] }".html_safe
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