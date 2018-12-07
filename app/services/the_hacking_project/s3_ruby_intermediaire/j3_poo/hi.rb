require 'sinatra'


module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
           class Hi
               def initialize
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::Hi.new.perform
               end

               def perform
get '/hi' do
  "Hello World!"
end
               end
           end
       end
   end
end
