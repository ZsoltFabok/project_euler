require 'spec_helper'

describe Problems::Problem10 do
  subject(:problem) {Problems::Problem10.new}

  context "#calculate" do
    it "the sum of the primes below 10 is 17" do
      problem.calculate(10).should eq 17
    end
  end

  context "#execute" do
    it "the sum of the primes below 2000000 is 142913828922", slow: true do
      problem.execute.should eq 142913828922
    end
  end
end