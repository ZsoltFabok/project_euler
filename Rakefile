require 'rspec/core/rake_task'

task(:default).clear
task default: %w[spec:all]

RSpec::Core::RakeTask.new(:spec)

desc 'Run all tests regardless of tags'
RSpec::Core::RakeTask.new('spec:all') do |task|
  task.pattern = './spec/**/*_spec.rb'
  # I'm -O to set a different config file than .rspec (it says to
  # ignore certain test cases), and rspec doesn't complain if the file
  # cannot be found. With this approach I can ignore everthing provided
  # in .rspec
  task.rspec_opts = '--color -O .spec'
end
