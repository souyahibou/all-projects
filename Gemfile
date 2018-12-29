source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "redcarpet"
gem 'coderay'
gem "rouge-rails"

#############################################################################################
############################ Templates CSS  #################################################################

gem 'font-awesome-sass', '~> 5.5.0'   #added      @import "font-awesome";=> application.scss:  for loading icons
gem "bulma-rails", "~> 0.7.2"         #added      @import "bulma";=> application.scss:  template css
gem 'bootstrap-sass', '3.3.7'		      #ajout

#############################################################################################
############################ ENGINES  #################################################################
gem 'c_v',                  path: 'engines/thp/week/1/day/2/c_v'
gem 'cv_webpage',           path: 'engines/thp/week/1/day/2/cv_webpage'
gem 'google_page1',         path: 'engines/thp/week/1/day/3/google_page1'
gem 'google_page2',         path: 'engines/thp/week/1/day/4/google_page2'
gem 'mozilla_page',         path: 'engines/thp/week/1/day/4/mozilla_page'

gem 'je_me_presente',       path: 'engines/thp/week/4/day/2/je_me_presente'   #engine
gem 'movie_maker',          path: 'engines/thp/week/4/day/2/movie_maker'
gem 're_former',            path: 'engines/thp/week/4/day/2/re_former'

gem 'the_gossip_project',   path: 'engines/thp/week/4/day/3/the_gossip_project'
gem 'thp_moussaillons',     path: 'engines/thp/week/4/day/3/thp_moussaillons'

gem 'base_de_donnees',      path: 'engines/thp/week/4/day/4/base_de_donnees'

gem 'univers_response',     path: 'engines/thp/week/5/day/2/univers_response'

gem 'reservation',          path: 'engines/thp/week/5/day/4/reservation'
gem 'usine',                path: 'engines/thp/week/5/day/4/usine'
gem 'generate',             path: 'engines/thp/week/5/day/4/generate'
gem 'courses',              path: 'engines/thp/week/5/day/4/courses'

gem 'eventbrite',           path: 'engines/thp/week/5/day/5/eventbrite'

gem 'reservation_vol',      path: 'engines/thp/week/6/day/1/reservation_vol'

gem 'devise_demo',          path: 'engines/thp/week/6/day/2/devise_demo'
gem 'home_page',            path: 'engines/thp/week/6/day/2/home_page'

gem 'twitter_bis',          path: 'engines/thp/week/6/day/4/twitter_bis'

gem 'formulaire_stylay',    path: 'engines/thp/week/7/day/2/formulaire_stylay'

gem 'email_viewer',         path: 'engines/thp/week/9/day/3/email_viewer'

gem 'blog',                 path: 'engines/manifold_apps/blog'
gem 'hello_engine',         path: 'engines/manifold_apps/hello_engine'
gem 'login_password_full_master', path: 'engines/manifold_apps/login_password_full_master'

#############################################################################################
############################# CUSTOM FOR THIS APP ################################################################
# gem 'rails_12factor'              #ajout  instead config.serve_static_assets = true

gem 'sinatra'                     #ajout
gem 'gmail'                       #ajout

gem 'paper-pdf-parser'
gem 'rails-latex'                 #ajout
#############################################################################################
############################ TESTING DEBUGGING CONFIG  #################################################################
gem 'pry'                         #ajout
gem 'rspec'                       #ajout
gem "figaro"			                #ajout

#############################################################################################
############################ BDD  #################################################################
gem 'activerecord-diff'           #ajout
gem 'differ'                      #ajout

#############################################################################################
############################ DATA SCRAPPING REQUEST MANIPULATION  #################################################################
gem 'json'                        #ajout
gem 'csv'                         #ajout
gem 'roo'                         #ajout
gem 'geocoder'                    #ajout    or gem 'google-maps'

gem "google_drive"                #ajout
gem "koala"			                  #ajout  gem facebook
gem 'watir'                       #ajout
gem 'nokogiri'

#############################################################################################
############################ BASICS GEMS #################################################################

gem 'sprockets'                   #ajout
gem 'jquery-rails'                #uselfull(assets) can't be delete , '4.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
