Rails.application.routes.draw do
  namespace :api do
    resources :units, only: [:index, :create, :destroy, :update]
  end
  root 'units#index'
  resources :units, only: [:index]
end
