require_dependency 'home_page/application_controller'

module HomePage
  class PagesController < ApplicationController
    def index
        if moussaillon_signed_in? then
            redirect_to gossips_path, notice: "redirect_to redirection reussi vers gossips path"
        end
    end
  end
end
