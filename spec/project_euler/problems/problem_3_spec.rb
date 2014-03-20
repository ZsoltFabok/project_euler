require 'spec_helper'

describe Problems::Problem3 do
  subject(:problem) {Problems::Problem3.new}

  context "#calculate" do
    it "should return 2 as the largest prime factor of 2" do
      problem.calculate(2).should eq 2
    end

    it "should return 3 as the largest prime factor of 6" do
      problem.calculate(6).should eq 3
    end

    it "should return 7 as the largest prime factor of 7" do
      problem.calculate(7).should eq 7
    end

    it "should return 29 as the largest prime factor of 13195" do
      problem.calculate(13195).should eq 29
    end
  end

  context "#execute" do
    it "should return 6857 as the largest prime factor of 600851475143", slow: true do
      problem.execute.should eq 6857
    end
  end
end