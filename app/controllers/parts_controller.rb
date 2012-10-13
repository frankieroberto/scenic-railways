class PartsController < ApplicationController

  respond_to :html, :json

  def index
    find_scenic_route
    @parts = @scenic_route.scenic_route_parts.all
  end

  def new
    find_scenic_route
    @scenic_route_part = @scenic_route.scenic_route_parts.new
    find_routes
  end

  def edit
    find_scenic_route
    find_scenic_route_part
    find_routes
  end

  def create
    find_scenic_route
    @scenic_route_part = @scenic_route.scenic_route_parts.new(params[:scenic_route_part])

    if @scenic_route_part.save
      redirect_to scenic_route_parts_path(@scenic_route)
    else
    end
  end

  def update
    find_scenic_route
    find_scenic_route_part

    @scenic_route_part.update_attributes(params[:scenic_route_part])
    redirect_to scenic_route_parts_path(@scenic_route)
  end

  private

  def find_scenic_route
    @scenic_route = ScenicRoute.find(params[:scenic_route_id])
  end

  def find_scenic_route_part
    @scenic_route_part = @scenic_route.scenic_route_parts.find(params[:id])
  end

  def find_routes
    @routes = Route.all
  end

end
