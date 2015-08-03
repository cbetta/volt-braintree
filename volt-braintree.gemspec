# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volt/braintree/version'

Gem::Specification.new do |spec|
  spec.name          = "volt-braintree"
  spec.version       = Volt::Braintree::VERSION
  spec.authors       = ["Cristiano Betta"]
  spec.email         = ["cbetta@gmail.com"]
  spec.summary       = "A Volt component for the Braintree v.zero integration"
  spec.description   = "A wrapper around the Braintree gem that provides you with a way to load the Braintree v.zero dropin with 1 line of code."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "volt", "~> 0.9.0"
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency "rake"

  spec.add_dependency "braintree"
end
