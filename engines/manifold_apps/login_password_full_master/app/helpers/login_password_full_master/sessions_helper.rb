require_dependency "login_password_full_master/application_helper"

module LoginPasswordFullMaster
	module SessionsHelper

		def log_in(user)
			session[:user_id] = user.id
		end

		def logged_in?
			!current_user.nil?
		end

		def current_user
			@current_user ||= User.find_by(id: session[:user_id])
		end

		def log_out
			session.delete(:user_id)
			@current_user = nil
		end

	end
end
