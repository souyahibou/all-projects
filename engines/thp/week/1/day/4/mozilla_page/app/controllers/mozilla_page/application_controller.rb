module MozillaPage
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        data_path = "source_code/mozilla_page/beginner_site"
        render file: "#{MozillaPage::Engine.root}/app/assets/#{data_path}/index", layout: false
    end
  end
end
