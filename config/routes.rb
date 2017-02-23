Rails.application.routes.draw do
  root 'sessions#home'
  get 'users/new'
  get '/signin' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :edit, :show, :create, :update, :destroy]
  get '/attractions' => 'attractions#index'
  resources :attractions, only: [:new, :edit, :create, :show, :update]
  post '/ride/:id' => 'attractions#ride'

end