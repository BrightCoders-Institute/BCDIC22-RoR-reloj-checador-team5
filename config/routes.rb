Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'checks#index'

	resources :login, only: [:index, :create]
	
	resources :admin, only: [:index]

  resources :employees
  resources :checks
  # Defines the root path route ("/")
  # root "articles#index"
end
