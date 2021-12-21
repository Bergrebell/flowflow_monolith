Rails.application.routes.draw do
  get 'stations/index'
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :stations, only: %i[index show]
    get 'station(/:id)/weather', to: 'stations#weather', as: :station_weather
    get 'station(/:id)/history', to: 'stations#history', as: :station_history

    get 'measurements', to: 'measurements#index'

    get :weather, to: 'weather#at_location'
  end

  # See CHECKS-file in root. This performs a simple check by dokku to see if the
  # server started after a deployment
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
