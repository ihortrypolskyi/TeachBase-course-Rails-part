Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  root "railway_stations#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
