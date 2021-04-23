$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = 'arcadia_cops'
  s.version = '3.6.0'
  s.summary = 'Arcadia Power Style Cops'
  s.description = 'Contains enabled rubocops for arcadia power ruby repos.'
  s.authors = %w(engineering)
  s.email = %w(engineering@arcadia.com)
  s.files = Dir['README.md', 'config/*.yml']
  s.homepage = 'https://github.com/ArcadiaPower/arcadia_cops/'
  s.license = 'MIT'

  s.add_dependency 'rubocop', '~> 1.13'
  s.add_dependency 'rubocop-rails', '~> 2.9'
  s.add_dependency 'rubocop-rspec', '~> 2.2'

  s.add_development_dependency 'bundler', '> 2.0.2'
  s.add_development_dependency 'rake'
end
