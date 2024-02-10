Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :ongs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :shelters, only: [:new, :create]
    resources :services, only: [:new, :create]
  end

  resources :shelters, only: [:index, :show, :edit, :update, :destroy] do
    # resources :beds, only: [:new, :create] 
    resources :bookings, only: [:new, :create]
  end

  post 'restaurar', to: 'bookings#restore', as: :restaurar

  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  get 'my_ongs', to: 'ongs#my_ongs', as: :my_ongs



  resources :bookings, only: [:index, :edit, :destroy]
  
  resources :beds, only: [:show, :edit, :update, :destroy]

  resources :services, except: [:new, :create]

  resources :volunteerings, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
end
