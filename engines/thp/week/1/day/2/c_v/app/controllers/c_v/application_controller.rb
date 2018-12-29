module CV
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        render file: "#{CV::Engine.root}/app/assets/source_code/c_v/CodeWeb3.html.erb", layout: false
    end
  end
end
