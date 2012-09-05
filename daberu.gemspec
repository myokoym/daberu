# -*- encoding: utf-8 -*-
require File.expand_path('../lib/daberu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["myokoym"]
  gem.email         = ["myokoym@gmail.com"]
  gem.description   = %q{Create a talkative object.}
  gem.summary       = %q{Create a talkative object}
  gem.homepage      = "https://github.com/myokoym/daberu"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "daberu"
  gem.require_paths = ["lib"]
  gem.version       = Daberu::VERSION

  gem.add_development_dependency 'rake', ['>= 0.9.2']
  gem.add_development_dependency 'rspec', ['>= 2.10.0']
  gem.add_development_dependency 'rdoc', ['>= 3.12']
end
