Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  resources :login, only: [:index, :create]
  
  resources :admin, only: [:index]

  resources :employees
  resources :checks
  resources :companies
  resources :admin, only: [:index]

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end

