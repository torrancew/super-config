require File.join(File.dirname(__FILE__), 'lib', 'super-config', 'version.rb')

Gem::Specification.new do |gem|
  gem.name    = 'super-config'
  gem.version = SuperConfig::VERSION
  gem.authors = ['Tray Torrance']
  gem.email   = ['gems@sudobangbang.org']

  gem.files = Dir['lib/**/*']

  gem.license     = 'MIT'
  gem.homepage    = 'https://github.com/torrancew/super-config'
  gem.summary     = 'A configuration loader based on RecursiveOpenStruct'
  gem.description =<<EOF
A configuration loader that implements priority loading
from YAML files (via safe_yaml), environment variables,
and user-specified hashes.
EOF

  gem.add_dependency 'safe_yaml',             '~> 1.0.0'
  gem.add_dependency 'recursive-open-struct', '~> 0.4.5'

  gem.add_development_dependency 'rake'
end

