require 'spec_helper'

describe Problems::Problem5 do
  subject(:problem) {Problems::Problem5.new}

  it "2520 is the smallest number that can be divided by each of the numbers from 1 to 10" do
    problem.execute(10).should eq 2520
  end

  it "232792560 is the smallest number that can be divided by each of the numbers from 1 to 20" do
    problem.execute(20).should eq 232792560
  end
end