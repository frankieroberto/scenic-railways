class StationsController < ApplicationController
  respond_to :html, :json
  def new
    @station = Station.find(params[:id])
  end
  def index

    @stations = Station.all
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @stations }
    end


  end
end

