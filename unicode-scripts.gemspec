# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/unicode/scripts/constants"

Gem::Specification.new do |gem|
  gem.name          = "unicode-scripts"
  gem.version       = Unicode::Scripts::VERSION
  gem.summary       = "Which script(s) does a Unicode string belong to?"
  gem.description   = "[Unicode #{Unicode::Scripts::UNICODE_VERSION}] Retrieve the Unicode script(s) a string belongs to. Can also return the Script_Extension property which is defined as characters which are 'commonly used with more than one script, but with a limited number of scripts'. "
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/unicode-scripts"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.0"
end
