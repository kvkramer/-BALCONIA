Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'


  get '/pages/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
  resources :spheres, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :chatrooms, only: [:create]
    resources :bookings, only: [:new, :create, :index]

  end
  resources :chatrooms, only: [:index, :show,] do
  resources :messages, only: [:create]
  end
    # get 'index', to: 'meetings#index'

  resources :bookings, only: [:index, :destroy]
end
