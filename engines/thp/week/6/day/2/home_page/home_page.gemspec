$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "home_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "home_page"
  s.version     = HomePage::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of HomePage."
  s.description = ": Description of HomePage."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency 'delayed_job_active_record'   	#ajout
  s.add_dependency 'jquery-turbolinks'            	#ajout
  s.add_dependency 'devise-i18n'                 	#ajout
  s.add_dependency 'rspec-rails', '~> 3.5.0'		#ajout
  s.add_dependency 'devise' 				#ajout
  s.add_dependency 'bootstrap-sass', '3.3.7'		#ajout
  s.add_dependency 'faker'		#ajout
  s.add_dependency 'bcrypt',         '3.1.11'		#ajout

  s.add_development_dependency "sqlite3"
end
