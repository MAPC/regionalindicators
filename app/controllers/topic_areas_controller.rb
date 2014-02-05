class TopicAreasController < ApplicationController
  def index
    @topic_areas = TopicArea.all
  end

  def show
    @topic_area = TopicArea.find params[:id]
  end
end
