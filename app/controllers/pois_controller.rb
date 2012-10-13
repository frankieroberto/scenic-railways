class PoisController < ApplicationController

  respond_to :html, :json

  def index
    @pois = Poi.all
    respond_with @pois
  end

  def new
    @poi = Poi.new
  end

  def update
    find_poi
    if @poi.update_attributes(params[:poi])
      redirect_to poi_path(@poi)
    else
      render 'edit'
    end
  end

  def create
    @poi = Poi.new(params[:poi])

    if @poi.save
      redirect_to poi_path(@poi)
    else
      render 'new'
    end
  end

  def show
    find_poi
    respond_with @poi
  end

  def edit
    find_poi
  end

  private

  def find_poi
    @poi = Poi.find(params[:id])
  end

end
