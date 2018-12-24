$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog"
  s.version     = Blog::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of Blog."
  s.description = ": Description of Blog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'uglifier', '>= 1.3.0'		#seem be useless
  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'turbolinks', '~> 5'
  s.add_development_dependency "sqlite3"
end
