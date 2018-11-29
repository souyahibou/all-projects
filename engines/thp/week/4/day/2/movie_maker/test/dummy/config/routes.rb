Rails.application.routes.draw do
  mount MovieMaker::Engine => "/movie_maker"
end
