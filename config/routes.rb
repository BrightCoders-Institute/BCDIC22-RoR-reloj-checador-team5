Rails.application.routes.draw do
  get 'admin/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  resources :employees
  resources :checks
  resources :companies
  resources :admin, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
