$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "login_password_full_master/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "login_password_full_master"
  s.version     = LoginPasswordFullMaster::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of LoginPasswordFullMaster."
  s.description = ": Description of LoginPasswordFullMaster."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"

  s.add_development_dependency "sqlite3"
end
