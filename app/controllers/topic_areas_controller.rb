class TopicAreasController < ApplicationController
  def index
    @topic_areas = {  featured:     TopicArea.featured.all,
                      not_featured: TopicArea.not_featured.all }
  end

  def show
    @topic_area = TopicArea.report.find params[:id]
  end

  def dashboard
    @topic_area = TopicArea.dashboard.find params[:id]
  end
  
end
