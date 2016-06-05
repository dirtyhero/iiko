Rails.application.routes.draw do
  root "images#index"

  resources :images
  resources :users

  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"
end
