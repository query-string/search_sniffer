# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sofatutor/search_sniffer/version'

Gem::Specification.new do |gem|
  gem.name          = "search_sniffer"
  gem.version       = Sofatutor::SearchSniffer::VERSION
  gem.authors       = ["ATimofeev", "Martin Glaß, sofatutor.com"]
  gem.email         = ["atimofeev@reactant.ru", "martin.glass@sofatutor.com"]
  gem.description   = %q{Simple plugin to sniff inbound search terms from popular search engines}
  gem.summary       = %q{Cleaned up and optimized Squeejee search_sniffer implementation}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/) - %w(.gitignore .ruby-version)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 3.2'
  gem.add_dependency 'rack'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rdoc'
end
