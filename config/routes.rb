Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:new, :create] do
    resources :groups, only: [:index, :show]
    resources :receipts, only: [:index, :show]
  end

  resources :receipts

  resources :groups
end
