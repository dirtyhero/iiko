Rails.application.routes.draw do
  root 'images#index'

  resources :users
  resources :images
  resources :likes

  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"
end
