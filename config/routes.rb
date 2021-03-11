Rails.application.routes.draw do  
  
  get "/renters/welcome", to: "renters#welcome", as: "welcome"
  get 'renters/new_user', to: 'renters#new_user'
  post 'renters/new_user', to: 'renters#create'
  get "/renters/login", to: "renters#login", as: "login"  
  post "renters/handle_login", to: "renters#handle_login"  
  get "/renters/profile", to: "renters#profile", as: "profile" 
  get "/renters/logout", to: "renters#destroy", as: "logout"
  get "/renters/goodbye", to: "renters#goodbye", as: "goodbye" 
  resources :renters

  get "/pets/petslist", to: "pets#petslist", as: "petslist"
  get "/pets/allpets", to: "pets#allpets", as: "allpets"
  get "/pets/search_by_name", to: "pets#search_by_name", as: "search_by_name"
  get "/pets/index", to: "pets#index", as: "pets"
  get "/pet/:id", to: "pets#show", as: "pet"

  get "/bookings/destroy", to: "bookings#destroy", as: "destroy"
  get "/bookings/cancel_confirmation", to: 
  "bookings#cancel_confirmation", as: "cancel"
 
  resources :bookings

  #resources :reviews

  
  get '/reviews', to: 'reviews#index', as: 'reviews'
  get '/reviews/new', to: 'reviews#new', as: 'new_review'
  post '/reviews', to: 'reviews#create'
  #resources :pets
  #resource :bookings

  #get '/bookings/', to: 'bookings#index', as: 'bookings'
  
  # get '/bookings/new', to: 'bookings#new', as: 'new_booking'
  # post '/bookings/', to: 'bookings#create'
  
  # get '/bookings/:id', to: ' bookings#show', as: 'booking'
  
  # resources :breeds
  # get '/login', to: 'renters#new'
  # post '/login', to: 'renters#create'
  # get '/welcome', to: 'renters#welcome'
end