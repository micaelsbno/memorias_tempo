Rails.application.routes.draw do
  root 'homepage#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'

  resources :users
  resources :posts
  resource :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
