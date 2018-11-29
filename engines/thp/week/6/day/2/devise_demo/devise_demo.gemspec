$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_demo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_demo"
  s.version     = DeviseDemo::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of DeviseDemo."
  s.description = ": Description of DeviseDemo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency 'devise'				              #ajout
  s.add_dependency 'devise_zxcvbn'              #ajout
  s.add_dependency 'devise-i18n'                 #ajout
  s.add_dependency 'delayed_job_active_record'   #ajout

  s.add_dependency 'jquery-turbolinks'          #pipeline
  s.add_dependency 'bootstrap-sass', '3.3.7'		#pipeline
  s.add_dependency 'coffee-rails'  	            #pipeline

  s.add_development_dependency "sqlite3"
end
