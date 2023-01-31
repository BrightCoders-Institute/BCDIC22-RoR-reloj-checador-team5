Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  resources :login, only: [:index, :create]
  
  resources :admin, only: [:index]

  resources :employees
  resources :checks
  #resources :admin_reports, only: [:index], via: [:get, :post]
  match 'admin_reports', to: 'admin_reports#index', via: [:get]
  resources :companies

  # Defines the root path route ("/")
  # root "articles#index"
end

