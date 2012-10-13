class RoutesController < ApplicationController

  respond_to :html, :json

  def index
    @routes = Route.all
    respond_with @routes
  end

  def new
    @route = Route.new
    @stations = Station.order(:name)
  end

  def create
    @route = Route.new(params[:route])
    if @route.save
      redirect_to route_path(@route)
    else
      render 'new'
    end
  end

  def edit
    @route = Route.find(params[:id])
    @stations = Station.order(:name)
  end

  def show
    @route = Route.find(params[:id])
    respond_with @route
  end

  def update
    @route = Route.find(params[:id])
    @route.update_attributes(params[:route])
    redirect_to route_path(@route)
  end

end
