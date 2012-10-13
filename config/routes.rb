ScenicRailways::Application.routes.draw do

  resources :scenic_routes do
    resources :parts
    resource :map, :controller=>"map"
  end
  resources :routes
  resources :stations

  resources :pois
  resources :vois

  root :to => 'homepage#show'


end
