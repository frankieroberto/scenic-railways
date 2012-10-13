class StationsController < ApplicationController
  respond_to :html, :json
  def new
    @station = Station.find(params[:id])
  end
  def index
    @stations = Station.all
    respond_with @station
  end
end

