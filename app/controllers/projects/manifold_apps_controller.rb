module Projects
  class ThpController < ApplicationController
      protect_from_forgery except: :execute
      def blog_engine_action
          redirect_to blog_engine_path + "/articles"
      end

      def hello_engine_action
          redirect_to hello_engine_path
      end


      def login_password_full_master_engine_action
          redirect_to login_password_full_master_engine_path
      end
  end
end
