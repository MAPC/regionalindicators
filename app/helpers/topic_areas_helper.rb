module TopicAreasHelper

  def thumb_for(value, *args)
    direction = words_for(value,
                          reverse:  is_reverse?(args.first),
                          success: 'up',
                          failure: 'down')
    "<span class=\"glyphicon glyphicon-thumbs-#{direction}\"></span>".html_safe
  end

  def alert_class_for(value, *args)
    status = words_for(value,
                       reverse: is_reverse?(args.first),
                       success: 'success',
                       failure: 'danger')
    "alert-#{status}".html_safe
  end


  # Will return a success word if >= 0 and fail if < 0, unless
  # reverse: true, in which case the opposite will happen

  def words_for(value, *args)
    args = args.first
    if args.fetch(:reverse, false)
      value.to_i >= 0 ? args.fetch(:failure, 'fail') : args.fetch(:success, 'succeed')
    else
      value.to_i >= 0 ? args.fetch(:success, 'succeed') : args.fetch(:failure, 'fail')
    end
  end

  # Checks if the 'reverse' argument is present and true

  def is_reverse?(*args)
    if !args.compact.empty? && args.first.has_key?(:reverse)
      args.first[:reverse]
    else
      return false
    end
  end

end
