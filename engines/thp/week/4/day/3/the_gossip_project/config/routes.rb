TheGossipProject::Engine.routes.draw do
  resources :gossips
  root 'gossips#index'
end
