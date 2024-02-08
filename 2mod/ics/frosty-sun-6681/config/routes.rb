Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show] do
    scope module: :doctor do
      resources :patients, only: [:destroy]
    end
  end

  resources :patients, only: [:index]
end
