$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "thp_moussaillons/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "thp_moussaillons"
  s.version     = ThpMoussaillons::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of ThpMoussaillons."
  s.description = ": Description of ThpMoussaillons."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency 'bootstrap-sass', '3.3.7'

  s.add_development_dependency "sqlite3"
end
