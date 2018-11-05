Rails.application.routes.draw do
  root 'pages#index'
  get '/register', to: 'users#register'
  
  get '/login', to: 'sessions#login'

  resources :users
  resources :posts
  resource :sessions, only: [:create, :destroy]
  post '/sessions/gps_position', to: 'api/sessions#save_location_by_gps'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
