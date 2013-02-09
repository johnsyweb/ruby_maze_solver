# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maze/version'

Gem::Specification.new do |gem|
  gem.name          = "maze"
  gem.version       = Maze::VERSION
  gem.authors       = ["Pete Johns"]
  gem.email         = ["paj-github@johnsy.com"]
  gem.description   = %q{A gem to solve a 2D maze.}
  gem.summary       = %q{Written as an exercise}
  gem.homepage      = "https://github.com/johnsyweb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
