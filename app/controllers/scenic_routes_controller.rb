class ScenicRoutesController < ApplicationController

  respond_to :html, :json

  def show
    @scenic_route = ScenicRoute.find(params[:id])
    respond_with @scenic_route do |format|
      format.json { render :json => @scenic_route.as_json }
    end
  end

  def index
    @scenic_route = ScenicRoute.all

    respond_with @scenic_route
  end

  def new
    @scenic_route = ScenicRoute.new
  end

  def create
    @scenic_route = ScenicRoute.new(params[:scenic_route])
    if @scenic_route.save
      redirect_to scenic_route_path(@scenic_route)
    else
      render 'new'
    end
  end

end
