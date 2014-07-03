Rails.application.routes.draw do
  require "monban/constraints/signed_in"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]do
   resource :following_relationship, only: [:create, :destroy]
 end 

  resources :shouts, only: [:create]
  resources :text_subjects, only: [:create]
  resources :image_subjects, only: [:create]

  get "/sign_up", to: "users#new"
  
  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
    resource :followers, only: [:show]
    resource :following, only: [:show]
  end

  root to: 'sessions#new'

  get '/:user_name' => 'users#show', :as => :user
end


