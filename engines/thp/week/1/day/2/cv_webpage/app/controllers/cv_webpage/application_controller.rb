module CvWebpage
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

      def home
          data_path = "source_code/cv_webpage"
          render file: "#{CvWebpage::Engine.root}/app/assets/#{data_path}/CodeWeb3.html.erb", layout: false
      end
  end
end
