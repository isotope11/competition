$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "competition/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Competition"
  s.version     = Competition::VERSION
  s.authors     = ["Adam Gamble"]
  s.email       = ["adamgamble@gmail.com"]
  s.homepage    = "http://github.com/isotope11/competition"
  s.summary     = "Rails engine to handle leaderboards and scoring"
  s.description = "Easily trigger scoring from within your models"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
