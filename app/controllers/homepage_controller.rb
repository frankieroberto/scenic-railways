class HomepageController < ApplicationController

  def show
    @scenic_routes = ScenicRoute.all
  end

end
