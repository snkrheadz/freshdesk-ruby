# -*- encoding: utf-8 -*-
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freshdesk/version'

Gem::Specification.new do |s|
  s.name          = "freshdesk-ruby"
  s.version       = Freshdesk::VERSION
  s.authors       = ["Akira Narita", "Graham Novak"]
  s.email         = ["aki.d.sc@gmail.com", "novak.graham@gmail.com"]
  s.required_ruby_version     = ">= 2.2.2"
  s.required_rubygems_version = ">= 1.8.11"

  s.summary       = %q{A Ruby API client for Freshdesk API v2}
  s.description   = %q{A Ruby API client for Freshdesk API v2}
  s.homepage      = "https://github.com/akinrt/freshdesk-ruby"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "json", "~> 2.0.3"
  s.add_development_dependency "rest-client", "~> 2.0.1"
end
