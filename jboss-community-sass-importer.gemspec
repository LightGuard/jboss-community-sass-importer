# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jboss-community-sass-importer/version'

Gem::Specification.new do |gem|
  gem.name          = "jboss-community-sass-importer"
  gem.version       = Jboss::Community::Sass::Importer::VERSION
  gem.authors       = ["LightGuard"]
  gem.email         = ["lightguard.jp@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency('sass', '>= 3.2.9')

  gem.add_development_dependency('rspec', '>= 2.13')
  gem.add_development_dependency('guard-rspec', '>= 3.0.0')
end
