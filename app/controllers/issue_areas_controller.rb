class IssueAreasController < ApplicationController

  def show
    @issue_area = IssueArea.find params[:id]
  end

end
