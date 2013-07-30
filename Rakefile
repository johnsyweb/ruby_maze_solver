# encoding: utf-8

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')
task default: [:spec]

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

