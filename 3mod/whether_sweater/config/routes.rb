Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v0 do
      get 'forecast' => 'forecast#search'
      post 'sessions' => 'users#login', as: :login
      post 'road_trip' => 'road_trip#create', as: :road_trip
      resources :users, only: [:create]
    end

    namespace :v1 do
      get 'book-search' => 'books#search'
      get 'activities' => 'activities#search'
    end
  end
end
