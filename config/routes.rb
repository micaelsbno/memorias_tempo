Rails.application.routes.draw do
  root 'pages#index'
  get '/register', to: 'users#register'
  
  get '/login', to: 'sessions#login'

  resources :users
  resource :sessions, only: [:create, :destroy]
  post '/sessions/gps_position', to: 'api/sessions#save_location_by_gps'
  post '/posts', to: 'api/posts#create'
  post '/post_by_ip', to: 'api/posts#create_by_ip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
