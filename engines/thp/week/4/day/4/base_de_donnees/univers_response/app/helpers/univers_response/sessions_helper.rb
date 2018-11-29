require_dependency "univers_response/application_helper"

module UniversResponse
  module SessionsHelper

    # Logs in the given user.
    def log_in(user)
      session[:user_id] = user.id
    end
  end
end
