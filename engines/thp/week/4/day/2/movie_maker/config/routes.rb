MovieMaker::Engine.routes.draw do
  root 'movies#index'
  get 'movies/(show)(/:num_mv)',	to: 'movies#show',	as: 'movie_sp'
end
