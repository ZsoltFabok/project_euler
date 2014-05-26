require 'spec_helper'

describe Math::Factorial do
  subject(:factorial) {Math::Factorial.new}

  context "#get" do
    it "should return 1 for 1" do
      factorial.get(1).should eq 1
    end

    it "should return 6 for 3" do
      factorial.get(3).should eq 6
    end
  end
end