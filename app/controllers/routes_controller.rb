class RoutesController < ApplicationController

  respond_to :html, :json

  def index
    @routes = Route.all
    respond_with @routes
  end
  
  def new
  end

  def create
  end

  def edit
  end
  
  def show
    @route = Route.find(params[:id])
  end
end
