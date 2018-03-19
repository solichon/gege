Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'pages#home'

  get "home", to: "pages#home"
  get "about", to: "pages#about"

  resources :activities, only: [ :index, :show, :new, :create ]
  resources :timeslots, only: [ :index, :show, :new, :create ] do
    resources :bookings, only: [ :new, :create ]
  end
end
