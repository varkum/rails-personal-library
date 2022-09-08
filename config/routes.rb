Rails.application.routes.draw do
  resources :tvshows do
    collection do
      get 'filter'
    end
  end
  resources :articles do
    collection do 
      get 'filter'
    end
  end
  resources :movies do
    collection do
      get 'filter'
    end
  end
  resources :books do
    collection do
      get 'filter'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signin', to: "sessions#index"
  post 'signin', to: "sessions#create"
  delete 'signin', to: "sessions#destroy"

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'account', to: "users#index"
  get 'account/edit', to:"users#edit"
  patch 'account/edit', to: "users#update", as: :update_password

  get 'reset_password', to: "password_resets#index"
  post 'reset_password', to: "password_resets#create"
  get 'reset_password/edit', to: "password_resets#edit"
  patch 'reset_password/edit', to: "password_resets#update"

  get "home", to: "items#index"
  # Defines the root path route ("/")
  root "sessions#index"
end
