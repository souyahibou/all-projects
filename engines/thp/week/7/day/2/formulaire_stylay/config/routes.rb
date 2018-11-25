FormulaireStylay::Engine.routes.draw do
  # devise_for :users, class_name: "FormulaireStylay::User", module: :devise
  get "users/login",  to: "users#login", as: :new_way_add_users
  root "users#login"
  resources :users
end
