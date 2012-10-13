class ScenicRoutesController < ApplicationController

  respond_to :html, :json

  def show
    @scenic_route = ScenicRoute.find(params[:id])
  end

  def index
    @scenic_route = ScenicRoute.all

    respond_with @scenic_route
  end

end
