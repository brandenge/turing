Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show]
  resources :dish_ingredients, only: [:create]
  resources :chefs, only: [:show] do
    # resources :ingredients, only: [:index], module: :chef
    # resources :ingredients, only: [:index], module: :chef, on: :collection

    scope on: :collection, module: :chef do
      resources :ingredients, only: [:index]
    end
  end
end
