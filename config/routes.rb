Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  
  resources :schedules
  
  resources :users, only: [:edit, :update, :show, :index]
  
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  get "maps/index"
  resources :maps, only: [:index]
end