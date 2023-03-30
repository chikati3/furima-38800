Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items

  resources :items, only: [:show] do
    resources :orders, only: [:index]
  end
end
