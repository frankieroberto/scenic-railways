ScenicRailways::Application.routes.draw do

  resources :scenic_routes, :only => [:show, :index]

  root :to => 'homepage#show'


end
