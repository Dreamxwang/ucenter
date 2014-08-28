# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ucenter/version'

Gem::Specification.new do |spec|
  spec.name          = "ucenter"
  spec.version       = Ucenter::VERSION
  spec.authors       = "Willin Wang"
  spec.email         = "willin@willin.org"
  spec.summary       = %q{Ruby uc_client for Ucenter Sever.}
  spec.description   = %q{http://willin.wang visit for more info.}
  spec.homepage      = "https://github.com/willin/ucenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~>0"
  spec.add_development_dependency "mysql2", "~>0"
  spec.add_development_dependency "nokogiri", "~>0"
end
