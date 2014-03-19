require 'rspec'
require 'debugger'
require 'coveralls'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '/spec/'
end

# should call after SimpleCov.start otherwise the code won't be part of the report
require File.expand_path('../../lib/project_euler', __FILE__)