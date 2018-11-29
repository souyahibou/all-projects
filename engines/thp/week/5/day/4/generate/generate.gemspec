$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "generate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "generate"
  s.version     = Generate::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of Generate."
  s.description = ": Description of Generate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
