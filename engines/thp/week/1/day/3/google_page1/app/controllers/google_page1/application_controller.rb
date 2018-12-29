module GooglePage1
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        data_path = "source_code/google_page1"
        render :file => "#{GooglePage1::Engine.root}/app/assets/#{data_path}/GooglePage.html.erb", layout: false
    end
  end
end
