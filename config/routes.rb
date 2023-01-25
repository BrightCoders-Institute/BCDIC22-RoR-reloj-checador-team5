Rails.application.routes.draw do
  get 'admin_reports/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

  resources :employees
  resources :checks
  resources :admin_reports, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
