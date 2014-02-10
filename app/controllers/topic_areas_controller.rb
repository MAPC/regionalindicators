class TopicAreasController < ApplicationController
  def index
    @topic_areas = {  featured:     TopicArea.featured.all,
                      not_featured: TopicArea.not_featured.all }

  end

  def show
    @topic_area = TopicArea.find params[:id]
  end
end
