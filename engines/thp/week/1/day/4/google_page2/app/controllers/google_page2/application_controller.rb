module GooglePage2
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def home
      data_path = "source_code/google_page2" 
      render :file =>"#{GooglePage2::Engine.root}/app/assets/#{data_path}/GooglePage", layout: false
    end
  end
end
