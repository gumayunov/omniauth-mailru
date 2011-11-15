# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new

desc 'Run specs'
task :default => :spec
