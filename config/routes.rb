Rails.application.routes.draw do
  devise_for :users
  root "schedules#index"
  resources :schedules, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :users, only: [:edit, :update]
end

