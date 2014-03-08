require 'spec_helper'

describe Attic::Number do
  context "#number_of_digits" do
    it "should return 1 for 1" do
      Attic::Number.number_of_digits(1).should eq 1
    end

    it "should return 4 for 9009" do
      Attic::Number.number_of_digits(9009).should eq 4
    end
  end
end