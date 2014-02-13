class SearchController < ApplicationController
  def search
  	@search = Sunspot.search [Explanation] do
  		fulltext params[:search]
  	end
    @results = @search.results
    render "search/search"
  end
end