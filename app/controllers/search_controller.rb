class SearchController < ApplicationController
  def search
  end

  def suggest
    @suggestions = []
    [TopicArea, IssueArea, Goal].each do |klass|
      @suggestions.concat( klass.all.map { |e| "#{e.title} (#{klass.name.titleize})" } )
    end

    render json: @suggestions
  end
end
