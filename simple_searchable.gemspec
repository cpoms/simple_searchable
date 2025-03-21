# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_searchable/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_searchable"
  spec.version       = SimpleSearchable::VERSION
  spec.authors       = ["Mike Campbell"]
  spec.email         = ["mike@wordofmike.net"]
  spec.summary       = %q{A very simple ActiveRecord search pattern}
  spec.homepage      = "http://www.github.com/meritec/simple_searchable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
