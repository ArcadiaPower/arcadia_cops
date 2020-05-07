$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = 'arcadia_cops'
  s.version = '3.5.3'
  s.summary = 'Arcadia Power Style Cops'
  s.description = 'Contains enabled rubocops for arcadia power ruby repos.'
  s.authors = %w(justin)
  s.email = %w(justin@arcadiapower.com)
  s.files = Dir['README.md', 'config/*.yml']
  s.homepage = 'https://github.com/ArcadiaPower/arcadia_cops/'
  s.license = 'MIT'

  s.add_dependency 'rubocop', '0.63.1'
  s.add_dependency 'rubocop-rspec', '1.32'

  s.add_development_dependency 'bundler', '> 2.0.2'
  s.add_development_dependency 'rake'
end
