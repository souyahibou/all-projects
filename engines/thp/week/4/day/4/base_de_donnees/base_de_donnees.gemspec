$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "base_de_donnees/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "base_de_donnees"
  s.version     = BaseDeDonnees::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of BaseDeDonnees."
  s.description = ": Description of BaseDeDonnees."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
