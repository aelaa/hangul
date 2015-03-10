# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hangul/version'

Gem::Specification.new do |spec|
  spec.name          = 'hangul'
  spec.version       = Hangul::VERSION
  spec.authors       = ['aelaa']
  spec.email         = ['aelaau@gmail.com']
  spec.description   = 'Hangul -> English transcription'
  spec.summary       = 'Multi-language transcription'
  spec.homepage      = 'http://github.com/aelaa/hangul'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pre-commit'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'korean-string'
end
