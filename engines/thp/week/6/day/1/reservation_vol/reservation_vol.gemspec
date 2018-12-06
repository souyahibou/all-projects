$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reservation_vol/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reservation_vol"
  s.version     = ReservationVol::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of ReservationVol."
  s.description = ": Description of ReservationVol."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency "faker"

  s.add_development_dependency "sqlite3"
end
