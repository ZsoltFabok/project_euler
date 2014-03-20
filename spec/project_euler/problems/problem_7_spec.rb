require 'spec_helper'

describe Problems::Problem7 do
  subject(:problem) {Problems::Problem7.new}

  context "#calculate" do
    it "returns 13 as the 6th prime number" do
      problem.calculate(6).should eq 13
    end

    it "returns 541 as the 100th prime number" do
      problem.calculate(100).should eq 541
    end

    it "returns 3581 as the 500th prime number" do
      problem.calculate(500).should eq 3571
    end

    it "returns 7919 as the 1000th prime number" do
      problem.calculate(1000).should eq 7919
    end
  end

  context "#execute" do
    it "returns 104743 as the 10001st prime number" do
      problem.execute.should eq 104743
    end
  end
end