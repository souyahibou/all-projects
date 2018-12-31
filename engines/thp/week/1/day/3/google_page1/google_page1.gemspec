$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "google_page1/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "google_page1"
  s.version     = GooglePage1::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = "https://all-projects.herokuapp.com"
  s.summary     = "Summary of GooglePage1: remake of google home page"
  s.description = "Description of GooglePage1: uses html and css tools"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"

  s.add_development_dependency "sqlite3"
end
