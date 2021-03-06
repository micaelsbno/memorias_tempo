# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"
  get "/register", to: "users#register"

  get "/login", to: "pages#index"

  resource :sessions, only: [:create, :destroy]
  get "/sessions", to: "sessions#login"
  resources :users
  get "/dashboard_posts/:id", to: "api/posts#dashboard_get_more_posts"
  get "/user_posts/:id", to: "api/posts#get_more_posts"
  get "/user/:id", to: "users#show"
  post "/sessions/gps_position", to: "api/sessions#save_location_by_gps"
  post "/posts", to: "api/posts#create"
  post "/post_by_ip", to: "api/posts#create_by_ip"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
