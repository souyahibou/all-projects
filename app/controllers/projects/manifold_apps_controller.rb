module Projects
  class ThpController < ApplicationController
      protect_from_forgery except: :execute
    
  end
end
