module TopicAreasHelper

  DEFAULT_SUCCESS = 'success'
  DEFAULT_FAILURE = 'danger'
  DEFAULT_NEUTRAL = 'info'
  

  def thumb_for(value, *args)
    icon = words_for(value, reverse:  is_reverse?(args.first),
                            success: 'thumbs-up',
                            failure: 'thumbs-down',
                            neutral: 'minus')
    content_tag(:span, nil, class: "glyphicon glyphicon-#{icon}")
  end


  def alert_class_for(value, *args)
    status = words_for(value, reverse: is_reverse?(args.first))
    "alert-#{status}".html_safe
  end


  # Will return a success word if >= 0 and fail if < 0, unless
  # reverse: true, in which case the opposite will happen

  def words_for(value, *args)
    @args = args.first
    if !@args.fetch(:reverse)
      normal_success(value)
    else
      reverse_success(value)
    end
  end


  # Checks if the 'reverse' argument is present and true
  def is_reverse?(*args)
    !args.compact.empty? && args.first.has_key?(:reverse) ? args.first[:reverse] : false
  end


  def fail
    @args.fetch :failure, DEFAULT_FAILURE
  end


  def succeed
    @args.fetch :success, DEFAULT_SUCCESS
  end


  def neutral
    @args.fetch :neutral, DEFAULT_NEUTRAL
  end


  def normal_success(value)
    if value.to_i > 0
      succeed
    elsif value.to_i < 0
      fail
    else
      neutral
    end
  end


  def reverse_success(value)
    if value.to_i > 0
      fail
    elsif value.to_i < 0
      succeed
    else
      neutral
    end
  end

end

