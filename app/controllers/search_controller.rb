class SearchController < ApplicationController

  def search
    # @search = Sunspot.search(Goal, Indicator) do
    #   fulltext params[:search], highlight: true
    # end

    # @results = @search.results
    @results = Search.new(query: params[:search]).results
  end

  def suggest
    @suggestions = []
    [Indicator, Goal].each do |klass|
      @suggestions.concat( klass.all.map { |e| e.title } )
    end

    render json: @suggestions
  end
end
