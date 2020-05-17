Rails.application.routes.draw do
  devise_for :users
  root "schedules#index"
  resources :schedules
  resources :users, only: [:edit, :update]
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  get "maps/index"
  resources :maps, only: [:index]
end