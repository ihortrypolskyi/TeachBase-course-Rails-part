Rails.application.routes.draw do
  root "railway_stations#index"

  resources :railway_stations
  resources :routes
  resources :trains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
