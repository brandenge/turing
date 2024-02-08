Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'application#welcome'

  get '/residents', to: 'residents#index'
  get '/residents/:id', to: 'residents#show'

  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show'
end
