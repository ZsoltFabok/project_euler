require 'spec_helper'

describe Problems::Problem1 do
  subject(:problem) {Problems::Problem1.new}

  it "multiples of 3 and 5 should give 23 under 10" do
    problem.execute(10).should eq 23
  end

  it "multiples of 3 and 5 should give 233168 under 1000" do
    problem.execute(1000).should eq 233168
  end
end