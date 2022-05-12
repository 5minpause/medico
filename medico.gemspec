require File.expand_path('../lib/medico/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'medico'
  gem.version     = Medico::VERSION
  gem.summary     = "A framework for business logic."
  gem.description = "Defines a framework for defining business logic in operation classes."
  gem.authors     = ["Holger Frohloff"]
  gem.email       = "holger@holgerfrohloff.de"
  gem.homepage    =
  'https://rubygems.org/gems/medico'
  gem.license       = 'MIT'

  gem.require_paths = %w[lib]
  gem.files = Dir.glob("lib/**/*.rb")
  gem.test_files = Dir.glob("spec/**/*.rb")
end
