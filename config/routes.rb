Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  namespace :authentication, path: '', as: '' do
    resources :sessions, only: [:new, :create]
  end
  
  resources :admin, only: [:index]

  resources :employees
  resources :checks
  #resources :admin_reports, only: [:index], via: [:get, :post]
  match 'admin_reports', to: 'admin_reports#index', via: [:get]
  resources :companies

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
