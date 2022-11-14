Rails.application.routes.draw do
  root "sessions#new"

  resources :users, only: [:show, :new, :create] do
    resources :groups, only: [:index, :show]
    resources :receipts, only: [:index, :show]
    resources :friend_requests, only: [:index, :new, :create]
  end
  resources :receipts
  resources :groups
  resource :session, only: [:new, :create, :destroy]
end
