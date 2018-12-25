require_dependency "login_password_full_master/application_controller"

module LoginPasswordFullMaster
	class SessionsController < ApplicationController

		def new
		end

	  def create
	    user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      log_in user
	      redirect_to home_path
	    else
		    render 'new'
	    end
	  end

		def destroy
			log_out
			redirect_to home_path
		end

	end
end
