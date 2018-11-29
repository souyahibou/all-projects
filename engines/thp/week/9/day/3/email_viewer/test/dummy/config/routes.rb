Rails.application.routes.draw do
  mount EmailViewer::Engine => "/email_viewer"
end
