$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "re_former/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "re_former"
  s.version     = ReFormer::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of ReFormer."
  s.description = ": Description of ReFormer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "pg"
end
