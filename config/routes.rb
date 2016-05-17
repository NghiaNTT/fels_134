Rails.application.routes.draw do
  get 'categories/new'

  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users, except: [:index]
  resources :categories, only: [:show, :index]
  namespace :admin do
    resources :categories, only: [:index]
  end
end
