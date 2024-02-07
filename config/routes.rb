Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :ongs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :shelters, only: [:new, :create]
    resources :services, only: [:new, :create]
  end

  resources :shelters, only: [:index, :show, :edit, :update, :destroy] do
    resources :beds, only: [:new, :create]
  end

  resources :beds, only: [:show, :edit, :update, :destroy]

  resources :services, except: [:new, :create]

  # Defines the root path route ("/")
  # root "articles#index"
end
