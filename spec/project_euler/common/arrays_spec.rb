require 'spec_helper'

describe Common::Arrays do
  context "#sum" do
    it "should return the sum of elements of a given array" do
      Common::Arrays.sum([1, 2, 3]).should eq 6
    end
  end

  context "#multiply_elements" do
    it "should multiply elements of array" do
      Common::Arrays.multiply_elements([2,3,5]).should eq 30
    end
  end
end