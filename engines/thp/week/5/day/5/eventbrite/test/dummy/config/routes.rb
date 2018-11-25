Rails.application.routes.draw do
  mount Eventbrite::Engine => "/eventbrite"
end
