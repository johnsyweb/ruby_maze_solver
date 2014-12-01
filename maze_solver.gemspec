# encoding: UTF-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maze_solver/version'

Gem::Specification.new do |gem|
  gem.name          = 'maze-solver'
  gem.version       = MazeSolver::VERSION
  gem.authors       = ['Pete Johns']
  gem.email         = ['paj-github@johnsy.com']
  gem.description   = 'A gem to solve a 2D maze.'
  gem.summary       = 'Written as an exercise'
  gem.homepage      = 'https://github.com/johnsyweb/ruby_maze_solver#readme'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(/^bin\//).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.require_paths = ['lib']
  gem.licenses      = 'MIT'
end
