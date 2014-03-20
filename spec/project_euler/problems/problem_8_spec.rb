require 'spec_helper'

describe Problems::Problem8 do
  subject(:problem) {Problems::Problem8.new}

  context "#calculate" do
    it "returns 7560 (79385) as the greatest product of five consecutive digits in 793856" do
      problem.calculate("793856").should eq 7560
    end
  end

  context "#execute" do
    it "returns X for the 1000 long number given in the problem" do
      problem.execute.should eq 40824
    end
  end
end