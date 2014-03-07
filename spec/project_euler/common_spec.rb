require 'spec_helper'

describe Common do
  it "#sum should return the sum of elements of a given array" do
    Common.sum([1, 2, 3]).should eq 6
  end
end