DeviseDemo::Engine.routes.draw do
  devise_for :users, class_name: "DeviseDemo::User", module: :devise 
  root to: 'pages#index'
  get '/secret', to: 'pages#secret', as: :secret
end
