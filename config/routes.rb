Rails.application.routes.draw do
  root "sessions#new"

  resources :users, only: [:show, :new, :create] do
    resources :receipts
    resources :friendships, only: [:new, :create]
  end
  resources :groups do
    resources :receipts
    resources :custom_splits
    resources :invitations
  end
  resource :session, only: [:new, :create, :destroy]
  resources :friendships, only: :update
end
