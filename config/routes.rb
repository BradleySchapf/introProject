Rails.application.routes.draw do
  get "moves/index"
  get "moves/show"
  get "about", to: "pages#index", as: "about"

  resources :moves, only: [:show]
  resources :types, only: [:index]
  resources :pokemons, only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#about"
end
