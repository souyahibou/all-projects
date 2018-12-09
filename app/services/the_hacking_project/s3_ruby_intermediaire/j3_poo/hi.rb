require 'sinatra'


module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
           class Hi < Sinatra::Base
               # def initialize
               #     puts " ;)"
               #     @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
               #     # TheHackingProject::S3RubyIntermediaire::J3Poo::Hi.new.perform
               # end

               # def perform
                   before { settings.title2 = "My Website 2" }

                   get '/hi' do
                     "Hello World!"
                   end
               # end


               set :title, "My Website"
               set :title2, settings.title
               # TheHackingProject::S3RubyIntermediaire::J3Poo::Hi.run!
               # match "/sinatra" => TheHackingProject::S3RubyIntermediaire::J3Poo::Hi, :anchor => false, via: [:get, :post]

                   get '/bye' do
                     "Good luck for the suite!"
                   end

                   get '/title' do
                     "<h1>#{ settings.title }</h1>"
                   end

                   get '/title2' do
                     "<h1>#{ settings.title2 }</h1>"
                   end

                   get '/return_value' do
                     halt [418, "I'm a tea pot!"]
                     "You'll never get here!"
                   end

                   self.get('/today') { "today is #{Date.today.to_s}\n" }

                   self.get '/' do
                     "<a href='/sinatra/hi'>more infos hi view</a><br>
                      <a href='/sinatra/bye'>more infos bye view</a><br>
                      <a href='/sinatra/title'>more infos title view</a><br>
                      <a href='/sinatra/title'>more infos title2 view</a><br>
                      <a href='/sinatra/title'>more infos return_value view</a>"
                   end
           end
       end
   end
end


# set :views, "/path/to/your/railsapp/views"
# set :erb, layout => :"layout/application" # or whatever rendering engine you chose
# http://www.sinatrarb.com/configuration.html


# require 'rack/mount' gem 'rack-mount'
# Routes = Rack::Mount::RouteSet.new do |set|
#    set.add_route Foo, :path_info => %r{^/foo$}
#    set.add_route Bar, :path_info => %r{^/bar$}
#    set.draw do |map|
#      map.connect 'products', :app => ListProducts
#      map.connect 'products/:id', :app => ShowProduct
#    end
# end
# run Routes
# TheHackingProject::S3RubyIntermediaire::J3Poo::Hi.Routes.run
# Rack::Mount::RouteSet.run TheHackingProject::S3RubyIntermediaire::J3Poo::Hi
