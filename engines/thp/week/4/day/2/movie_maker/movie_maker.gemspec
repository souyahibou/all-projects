$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "movie_maker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "movie_maker"
  s.version     = MovieMaker::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of MovieMaker."
  s.description = ": Description of MovieMaker."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "pg"
end
