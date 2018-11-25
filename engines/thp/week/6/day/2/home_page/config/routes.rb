HomePage::Engine.routes.draw do
  resources :gossips
  devise_for :moussaillons, class_name: "HomePage::Moussaillon", module: :devise
  root to: 'pages#index'
end
