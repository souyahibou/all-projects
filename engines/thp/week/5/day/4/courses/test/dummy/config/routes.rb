Rails.application.routes.draw do
  mount Courses::Engine => "/courses"
end
