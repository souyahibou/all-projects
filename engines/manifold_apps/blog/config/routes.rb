Blog::Engine.routes.draw do
  resources :articles
  root to: "welcome#index", as: "home"
end
