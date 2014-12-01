# encoding: utf-8

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

RSpec::Core::RakeTask.new('spec')
task default: [:spec, :rubocop]

begin
  require 'cane/rake_task'

  desc 'Run cane to check quality metrics'
  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_max = 10
    cane.no_style = true
    cane.abc_exclude = %w(Foo::Bar#some_method)
  end

  task default: [:quality]
rescue LoadError
  warn 'cane not available, quality task not provided.'
end

begin
  require 'churn'
  task default: [:churn]
rescue LoadError
  warn 'churn not available, churn task not provided.'
end
