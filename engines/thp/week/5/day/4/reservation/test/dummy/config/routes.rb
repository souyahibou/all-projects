Rails.application.routes.draw do
  mount Reservation::Engine => "/reservation"
end
