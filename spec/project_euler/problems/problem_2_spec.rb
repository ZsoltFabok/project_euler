require 'spec_helper'

describe Problems::Problem2 do
  subject(:problem) {Problems::Problem2.new}

  context "#calculate" do
    it "the sum of even values in fibonacci from 1 to 5 is 2" do
      problem.calculate(5).should eq 2
    end

    it "the sum of even values in fibonacci from 1 to 8 is 10" do
      problem.calculate(8).should eq 10
    end

    it "the sum of even values in fibonacci from 1 to 13 is 10" do
      problem.calculate(13).should eq 10
    end
  end

  context "#execute" do
    it "the sum of even values in fibonacci from 1 to 13 is 4613732" do
      problem.execute.should eq 4613732
    end
  end
end