$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "email_viewer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "email_viewer"
  s.version     = EmailViewer::VERSION
  s.authors     = ["Souyahibou"]
  s.email       = ["souaybou.k@live.fr"]
  s.homepage    = ""
  s.summary     = ": Summary of EmailViewer."
  s.description = ": Description of EmailViewer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_dependency 'sass-rails',   '5.0.6'
  s.add_dependency 'turbolinks',   '5.0.1'

  s.add_development_dependency "sqlite3"
end
