ThpMoussaillons::Engine.routes.draw do
  get 'corsairs/new'

  get 'corsairs/create'

  get 'corsairs/update'

  get 'corsairs/edit',          to:   'corsairs#edit',   as: 'moussaillon'

  get 'corsairs/destroy'

  get 'corsairs/index'

  get 'corsairs/show'

  root 'static_pages#home'
end
