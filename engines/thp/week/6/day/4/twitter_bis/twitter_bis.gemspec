$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "twitter_bis/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "twitter_bis"
  s.version     = TwitterBis::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of TwitterBis."
  s.description = ": Description of TwitterBis."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency 'twitter'
  s.add_dependency 'bootstrap-sass', '3.3.7'		   #ajout

  s.add_development_dependency "sqlite3"
end
  
