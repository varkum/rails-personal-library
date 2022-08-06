Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signin', to: "sessions#index"
  post 'signin', to: "sessions#create"
  delete 'signin', to: "sessions#destroy"

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'account', to: "users#index"
  get 'account/edit', to:"users#edit"
  patch 'account/edit', to: "users#update", as: :update_password

  get "home", to: "items#index"
  # Defines the root path route ("/")
  root "sessions#index"
end
