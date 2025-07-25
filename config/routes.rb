Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :collections
    resources :designers
    resources :games
    resources :libraries
    resources :players

    root to: "games#index"
  end

  resources :collections do
    resources :games
  end

  resources :designers do
    resources :games
  end

  resources :games

  resources :players do
    resources :collections
    resources :games
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "libraries#index"
end
