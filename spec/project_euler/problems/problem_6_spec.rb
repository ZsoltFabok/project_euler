require 'spec_helper'

describe Problems::Problem6 do
  subject(:problem) {Problems::Problem6.new}

  context "#calculate" do
    it "returns 2640 (3025 - 385) for 10" do
      problem.calculate(10).should eq 2640
    end
  end

  context "#execute" do
    it "returns 25164150 (25502500 - 338350) for 100" do
      problem.execute.should eq 25164150
    end
  end
end