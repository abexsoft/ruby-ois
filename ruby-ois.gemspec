lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-ois/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-ois"
  gem.version       = Ruby::Ois::VERSION
  gem.authors       = ["abexsoft"]
  gem.email         = ["abexsoft@gmail.com"]
  gem.description   = %q{A ruby binding for OIS.}
  gem.summary       = %q{A ruby binding for OIS.}
  gem.homepage      = "https://github.com/abexsoft/ruby-ois"
  gem.platform      = Gem::Platform::CURRENT

  gem.files         = Dir['Gemfile',
                          'LICENSE.txt',  
                          'README.md',
                          'Rakefile',
                          'ruby-ois.gemspec',
                          'bindings/ois/interface/**/*',
                          'deps/include/**/*',
                          'deps/lib/libOIS*.so*',
                          'deps/lib/libOIS*.so*',
                          'lib/**/*'
                         ]

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
