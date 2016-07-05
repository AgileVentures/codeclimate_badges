Gem::Specification.new do |s|
  s.name        = 'CodeClimateBadges'
  s.version     = '0.0.0'
  s.date        = '2016-07-05'
  s.summary     = "CodeClimateBadges"
  s.description = "Convenience methods for code climate badges"
  s.authors     = ["Sam Joseph"]
  s.email       = 'sam@agileventues.org'
  s.files       = ["lib/code_climate_badges.rb"]
  s.homepage    =
    'https://github.com/AgileVentures/codeclimate_badges'
  gem.add_dependency('httparty')  
  gem.add_development_dependency('rspec', ["3.4"])
  gem.add_development_dependency('vcr')
  gem.add_development_dependency('webmock')
  gem.add_development_dependency('byebug')
  s.license       = 'MIT'
end