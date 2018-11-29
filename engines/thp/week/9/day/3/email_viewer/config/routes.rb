EmailViewer::Engine.routes.draw do
  root to: 'emails#index'      #or root 'emails#edit'
  resources :emails
  # get 'emails/index',  to: 'emails#index'
end
