require_dependency "je_me_presente/application_controller"

module JeMePresente
  class StaticPagesController < ApplicationController
    def home
    end

    def contact
    end

    def about
  	@nom_page=params[:var]
    end
  end
end
