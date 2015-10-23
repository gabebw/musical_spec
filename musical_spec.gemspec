# -*- encoding: utf-8 -*-
require File.expand_path('../lib/musical_spec/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gabe Berke-Williams"]
  gem.email         = ["gabe@thoughtbot.com"]
  gem.description   = %q{A musical formatter for RSpec.}
  gem.summary       = %q{A musical formatter for RSpec. The sound gets lower as failures pile up, and higher when tests pass.}
  gem.homepage      = "https://github.com/gabebw/musical_spec"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "musical_spec"
  gem.require_paths = ["lib"]
  gem.version       = MusicalSpec::VERSION

  gem.add_dependency('bloopsaphone', '~> 0.4')
  gem.add_dependency('rspec-core', '~> 3.0')

  gem.add_development_dependency('rspec', '~> 3.0')
end
