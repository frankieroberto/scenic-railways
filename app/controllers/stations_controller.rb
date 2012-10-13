class StationsController < ApplicationController

  respond_to :html, :json

  def index
    @stations = Station.all
    respond_with @stations
  end

  def new
    @station = Station.new
  end

  def update
    find_station
    if @station.update_attributes(params[:station])
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end
  
  def create
    @station = Station.new(params[:station])

    if @station.save
      redirect_to station_path(@station)
    else
      render 'new'
    end
  end
  
  def show
    find_station
    respond_with @station
  end

  def find_station
    @station = Station.find(params[:id])
  end
end

