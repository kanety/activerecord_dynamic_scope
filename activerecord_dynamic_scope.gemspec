# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_dynamic_scope/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_dynamic_scope"
  spec.version       = ActiveRecordDynamicScope::VERSION
  spec.authors       = ["Yoshikazu Kaneta"]
  spec.email         = ["kaneta@sitebridge.co.jp"]
  spec.summary       = %q{Handling dynamic scope for ActiveRecord.}
  spec.description   = %q{Handling dynamic scope for ActiveRecord.}
  spec.homepage      = "https://github.com/kanety/activerecord_dynamic_scope"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0"
  
  spec.add_dependency "activerecord", ">= 7.0"
  spec.add_dependency "activesupport", ">= 7.0"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
end
