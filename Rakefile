#!/usr/bin/env rake
require "bundler"

task :default => [:spec]
begin
  Bundler::GemHelper.install_tasks
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = ['-cfs']
  end
rescue LoadError => e
end
