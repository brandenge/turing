Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      get 'markets/search' => 'markets#search'
      resources :markets, only: [:index, :show] do
        resources :vendors, only: [:index], module: :market, as: :with_vendors
        resources :nearest_atm, only: [:index], module: :market
      end

      resources :vendors, only: [:show, :create, :update, :destroy]
      resources :market_vendors, only: [:create]
      delete 'market_vendors' => 'market_vendors#destroy'
    end
  end
end
