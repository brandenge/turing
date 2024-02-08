Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register' => 'users#new', as: :new_user
  get '/login' => 'users#login_form', as: :login_form
  post '/login' => 'users#login_user', as: :login
  delete '/login' => 'users#logout_user', as: :logout

  resources :users, only: %i[create]
  resources :dashboard, only: [:index, :show], controller: :users, as: :user_dashboard do
    resources :discover, only: [:index]
    resources :movies, only: %i[index show] do
      resources :viewing_parties, only: %i[new create]
    end
  end
end
