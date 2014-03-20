require 'spec_helper'

describe Problems::Problem5 do
  subject(:problem) {Problems::Problem5.new}

  context "#calculate" do
    it "2520 is the smallest number that can be divided by each of the numbers from 1 to 10" do
      problem.calculate(10).should eq 2520
    end
  end

  context "#execute" do
    it "232792560 is the smallest number that can be divided by each of the numbers from 1 to 20" do
      problem.execute.should eq 232792560
    end
  end
end