# encoding: UTF-8

require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
require 'maze_solver'
require 'rspec/its'
require 'rubygems'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
