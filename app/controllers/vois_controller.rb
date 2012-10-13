class VoisController < ApplicationController

  respond_to :html, :json

  def index
    @vois = Voi.all
    respond_with @vois
  end

  def new
    @voi = Voi.new
    find_routes_and_pois
  end

  def update
    find_voi
    if @voi.update_attributes(params[:voi])
      redirect_to voi_path(@voi)
    else
      render 'edit'
    end
  end

  def create
    @voi = Voi.new(params[:voi])

    if @voi.save
      redirect_to voi_path(@voi)
    else
      render 'new'
    end
  end

  def show
    find_voi
    respond_with @voi
  end

  def edit
    find_voi
    find_routes_and_pois
  end

  private

  def find_voi
    @voi = Voi.find(params[:id])
  end

  def find_routes_and_pois
    @routes = Route.all
    @pois = Poi.all
  end

end
