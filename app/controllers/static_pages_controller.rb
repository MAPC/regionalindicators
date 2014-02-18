class StaticPagesController < ApplicationController
  def show
    @page = StaticPage.find_by_slug_id params[:id]
  end
end
