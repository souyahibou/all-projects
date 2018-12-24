LoginPasswordFullMaster::Engine.routes.draw do

  root to: "welcome#index", as: "home"
  resources :users

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
