ScenicRailways::Application.routes.draw do

  resources :scenic_routes, :only => [:show, :index]
  resources :routes
  resources :stations

  resources :pois
  resources :vois

  root :to => 'homepage#show'


end
