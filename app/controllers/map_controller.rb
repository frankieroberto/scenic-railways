class MapController < ApplicationController
  def show
    @scenic_routes = ScenicRoute.find(params[:scenic_route_id])
  end
end
