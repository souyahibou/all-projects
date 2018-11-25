BaseDeDonnees::Engine.routes.draw do
  resources :authors
  resources :posts
  resources :cours
  resources :lecons
  resources :pins
  resources :comments
  resources :users
  resources :links
  resources :matters
  resources :students
  root :to => 'firstc#index'
end
