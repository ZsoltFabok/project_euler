require 'spec_helper'

describe Problems::Problem1 do
  subject(:problem) {Problems::Problem1.new}

  context "#calculate" do
    it "multiples of 3 and 5 should give 23 under 10" do
      problem.calculate(10).should eq 23
    end
  end

  context "#execute" do
    it "multiples of 3 and 5 should give 233168 under 1000" do
      problem.execute.should eq 233168
    end
  end
end