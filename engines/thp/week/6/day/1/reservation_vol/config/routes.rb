ReservationVol::Engine.routes.draw do
  root 'flights#index'

  get 'flights/index', to: 'flights#index', as: 'index'

  resources :flights, only: [:new, :create, :show]
end
