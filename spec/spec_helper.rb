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

def mock_cache_file_content(numbers)
  file_content = double
  File.should_receive(:open).with("data/prime_numbers.txt", "r").and_yield(file_content)
  file_content.should_receive(:readlines).and_return(numbers.map {|n| "#{n}\n"})
end

def read_array_from_file(file_name)
  File.open(file_name).read.split("\n").map {|n| n.to_i}
end

def write_array_to_file(file_name, array)
  File.open(file_name, "w") {|f| f.write(array.join("\n"))}
end

def create_empty_file(file_name)
	FileUtils.touch(file_name)
end

def delete(file_name)
	FileUtils.rm_rf(file_name)
end