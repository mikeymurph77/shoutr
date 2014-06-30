Rails.application.routes.draw do
  require "monban/constraints/signed_in"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :shouts, only: [:create]

  get "/sign_up", to: "users#new"
  
  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
   end

  root to: 'sessions#new'
end
