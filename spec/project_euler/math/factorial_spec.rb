require 'spec_helper'

describe Math::Factorial do
  context "#get" do
    it "should return 1 for 1" do
      Math::Factorial.get(1).should eq 1
    end

    it "should return 6 for 3" do
      Math::Factorial.get(3).should eq 6
    end
  end
end