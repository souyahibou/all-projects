Rails.application.routes.draw do
  mount TwitterBis::Engine => "/twitter_bis"
end
