Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'

  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  match '/authors/:id', to: 'authors#update', via: [:put, :patch]
  delete '/authors/:id', to: 'authors#destroy'

  get '/books', to: 'books#index'
  get '/authors/:author_id/books', to: 'author/books#index'
  get '/authors/:author_id/books/new', to: 'author/books#new'
  post '/authors/:author_id/books', to: 'author/books#create'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  match '/books/:id', to: 'books#update', via: [:put, :patch]
  delete '/books/:id', to: 'books#destroy'
end
