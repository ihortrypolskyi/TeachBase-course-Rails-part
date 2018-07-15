Rails.application.routes.draw do
  root "railway_stations#index"

  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :trains do
    resources :carriages
  end
  resources :carriages

  get '/tickets/search', to: 'tickets#search'
  #get '/tickets', to: 'tickets#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
