require_dependency "univers_response/application_controller"

module UniversResponse
  class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
         log_in user
         redirect_to user
       else
         flash.now[:danger] = 'Adresse email invalid/password combinaison'
         render 'new'
       end
    end
  end
end