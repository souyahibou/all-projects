$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "formulaire_stylay/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "formulaire_stylay"
  s.version     = FormulaireStylay::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of FormulaireStylay."
  s.description = ": Description of FormulaireStylay."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency 'devise-i18n'
  s.add_dependency 'devise'

  s.add_dependency 'sass-rails',   '5.0.6'
  s.add_dependency 'uglifier',     '3.2.0'
  s.add_dependency 'coffee-rails', '4.2.2'
  # s.add_dependency 'jquery-rails', '4.3.1'

  s.add_dependency 'turbolinks',   '5.0.1'

  s.add_development_dependency "sqlite3"
end
