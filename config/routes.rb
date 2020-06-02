Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  get '/pages/contact', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
  resources :spheres, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :index]
  end

    # get 'index', to: 'meetings#index'

  resources :bookings, only: [:index, :destroy]
end
