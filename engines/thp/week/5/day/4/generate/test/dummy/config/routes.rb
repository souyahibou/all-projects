Rails.application.routes.draw do
  mount Generate::Engine => "/generate"
end
