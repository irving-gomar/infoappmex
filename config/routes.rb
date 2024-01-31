Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # ONG
  resources :ongs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :shelters, only: [:index, :new, :create]
  end


  
  resources :shelters, only: [:show, :edit, :update, :destroy] do
    resources :beds, only: [:new, :create]
  end

  resources :beds, only: [:show, :edit, :update, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
