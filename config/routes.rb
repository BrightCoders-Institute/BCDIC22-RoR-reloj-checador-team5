Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  namespace :authentication, path: '', as: '' do
    resources :sessions, only: [:new, :create]
  end
  
  resources :admin, only: [:index]

  resources :employees
  resources :checks
  resources :companies
  resources :admin, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
