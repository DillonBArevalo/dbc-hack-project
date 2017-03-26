Rails.application.routes.draw do

  root 'application#index'

  resources :groups

  resources :instructors

  resources :users

  resources :issues

  resources :comments

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
