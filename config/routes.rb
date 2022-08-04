Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :groups, only: [:index, :show, :new,:create] do
    resources :budgets, only: [:index, :show, :new, :create]
  end

  # Defines the root path route ("/")
  root "splash_screen#index"
end
