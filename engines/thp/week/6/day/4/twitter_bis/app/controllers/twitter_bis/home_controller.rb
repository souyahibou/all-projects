require_dependency "twitter_bis/application_controller"

module TwitterBis
  class HomeController < ApplicationController
    def index
        if request.get?
           @sendtweet = send_a_tweet("ok")
           @tweet = Class.new{attr_accessor :title, :content, :user, :arg_config, :description}.new
        elsif request.post?
            parameters = params.require(:tweet).permit(:title, :content, :user, :arg_config, :description)
            # @sendtweet.perform
            render :inline => "<h1 style='text-align:center'> <%=  'message sent?' %> <br> (check in back-end) <br> <%= #{parameters} %> </h1>"
        end
    end

    private

    def send_a_tweet message
        SendTweet.new(message)
    end
  end
end
