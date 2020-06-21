Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  
  resources :users, only: [:edit, :update, :show, :index]
  resources :homes, only: [:index]


  get '/map_request', to: 'maps#map', as: 'map_request'
  
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

  resources :shops, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :originals
  resources :events 

  post '/users/guest_sign_in', to: 'users#new_guest'

end