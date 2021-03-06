# Maze Solver
[![Build Status](https://travis-ci.org/johnsyweb/ruby_maze_solver.png)](https://travis-ci.org/johnsyweb/ruby_maze_solver)
[![Gem Version](https://badge.fury.io/rb/maze-solver.png)](http://badge.fury.io/rb/maze-solver)
[![Dependency Status](https://gemnasium.com/johnsyweb/ruby_maze_solver.png)](https://gemnasium.com/johnsyweb/ruby_maze_solver)
[![Code Climate](https://codeclimate.com/github/johnsyweb/ruby_maze_solver.png)](https://codeclimate.com/github/johnsyweb/ruby_maze_solver)
[![Coverage Status](https://coveralls.io/repos/johnsyweb/ruby_maze_solver/badge.png?branch=master)](https://coveralls.io/r/johnsyweb/ruby_maze_solver?branch=master)

Written as an exercise in applying Ruby, this project solves mazes:

    maze_solver etc/demo.maze 18 0 38 0
    About to solve your 40x14 maze from (18, 0) to (38,0).
    GO!
    Solved!
    ******************.*******************.*
    *      .......****.**      .......****.*
    * *****.*****...**.** *****.*****...**.*
    * *****.*******.**.** *****.*******.**.*
    * *    ......**.**.** *    ......**.**.*
    * **********.**....** **********.**....*
    ************.*******************.*******
    ************.***** *************.***** *
    *           ..****............... **** *
    * ***** *****...**.** ***** *****   ** *
    * ***** *******.**.** ***** ******* ** *
    * *          **.**.** *          ** ** *
    * ********** **....** ********** **    *
    ****************************************


## Installation

Maze Solver is available from
[RubyGems.org](https://rubygems.org/gems/maze-solver). Installation is simply:

    $ gem install maze-solver

[RubyGems.org gem replacement vulnerability and mitigation](http://blog.rubygems.org/2016/04/06/gem-replacement-vulnerability-and-mitigation.html): not affected.

## Usage

    $ maze_solver filename start_x start_y end_x end_y

## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Ensure the tests pass for all Rubies in [`.travis.yml`](https://github.com/johnsyweb/ruby_maze_solver/blob/master/.travis.yml)
1. Create new Pull Request

## Thanks

If you find this stuff useful, please follow this repository on
[GitHub](https://github.com/johnsyweb/ruby_maze_solver). If you have something to say,
you can contact [johnsyweb](http://johnsy.com/about/) on
[Twitter](http://twitter.com/johnsyweb/) and
[GitHub](https://github.com/johnsyweb/).

