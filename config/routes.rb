Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :budgets, only: [:index, :show, :new, :create]
    resources :groups, only: [ :new,:create]

  # Defines the root path route ("/")
  root "users#index"
end
