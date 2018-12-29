$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "c_v/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "c_v"
  s.version     = CV::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = "https://all-projects.herokuapp.com"
  s.summary     = "Summary of CV: a short basic html view"
  s.description = "Description of CV: use of html and css properties"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"

  s.add_development_dependency "sqlite3"
end
