require 'spec_helper'

describe Problem1 do
  it "multiples of 3 and 5 should give 23 under 10" do
    Problem1.new.execute(10).should eq 23
  end

  it "multiples of 3 and 5 should give 233168 under 1000" do
    Problem1.new.execute(1000).should eq 233168
  end
end