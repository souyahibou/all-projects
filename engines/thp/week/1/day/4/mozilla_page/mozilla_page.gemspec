$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mozilla_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mozilla_page"
  s.version     = MozillaPage::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = "https://all-projects.herokuapp.com"
  s.summary     = "Summary of MozillaPage: a short basic site"
  s.description = "Description of MozillaPage: using html, css and javascript"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"

  s.add_development_dependency "sqlite3"
end
