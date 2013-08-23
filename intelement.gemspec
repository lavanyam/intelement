# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intelement/version'

Gem::Specification.new do |spec|
  spec.name          = "intelement"
  spec.version       = IntelementVersion::VERSION
  spec.authors       = ["bitweft"]
  spec.email         = ["bitweft@gmail.com"]
  spec.description   = %q{A gem that provides an intelligent way to get various different element details}
  spec.summary       = %q{An intelligent wrapper over capybara that provides one generic method to get the details of a web element}
  spec.homepage      = "http://www.bitweft.com"
  spec.license       = "To be decided"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
