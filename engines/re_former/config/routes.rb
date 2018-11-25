ReFormer::Engine.routes.draw do
  # get 'users/edit'
  # get 'users/update'
  # get 'users/new'
  # get 'users/create'
  resources :users, only: [:new, :create, :edit, :update]
end
