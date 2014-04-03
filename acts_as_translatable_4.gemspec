# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_translatable_4/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_translatable_4"
  spec.version       = ActsAsTranslatable4::VERSION
  spec.authors       = ["Stjepan Hadjic"]
  spec.email         = ["d4be4st@gmail.com"]
  spec.summary       = %q{}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
