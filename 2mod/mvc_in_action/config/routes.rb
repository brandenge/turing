Rails.application.routes.draw do
  get '/comedians', to: 'comedians#index'
  get '/comedians/:id', to: 'comedians#show'
end
