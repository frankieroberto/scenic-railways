class ReverseController < ApplicationController

  respond_to :html, :json

  def show
    @scenic_route = ScenicRoute.find(params[:scenic_route_id])
    respond_with @scenic_route do |format|
      format.json { render :json => @scenic_route.as_json }
    end
  end

end
