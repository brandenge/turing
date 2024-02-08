Rails.application.routes.draw do
  root to: 'application#welcome'

  namespace :api do
    namespace :v0 do
      resources :subscriptions, only: [:index, :create, :update], controller: :subscription
    end
  end
end
