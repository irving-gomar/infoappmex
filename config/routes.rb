Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # ONG
  resources :ongs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :shelters, only: [:new, :create]
  end


  
  resources :shelters, only: [:index, :show, :edit, :update, :destroy] do
    # resources :beds, only: [:new, :create] 
    resources :bookings, only: [:new, :create]
  end

  post 'restaurar', to: 'bookings#restore', as: :restaurar

  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  get 'my_ongs', to: 'ongs#my_ongs', as: :my_ongs


  resources :beds, only: [:show, :edit, :destroy]

  resources :bookings, only: [:index, :edit, :destroy]
  
  # Defines the root path route ("/")
  # root "articles#index"
end
