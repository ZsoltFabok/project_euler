require 'spec_helper'

describe Problems::Problem18 do
  subject(:problem) {Problems::Problem18.new}

  context "#calculate" do
    it "returns 3 for 3" do
      problem.calculate("3").should eq 3
    end

    it "returns 10 for [3][7,4]]" do
      problem.calculate("3 7 4").should eq 10
    end

    it "returns 14 for [3],[7,4],[2,4,6]]" do
      problem.calculate("3 7 4 2 4 6").should eq 14
    end

    it "returns 23 for [3],[7,4],[2,4,6],[8,5,9,3]]" do
      problem.calculate("3 7 4 2 4 6 8 5 9 3").should eq 23
    end
  end

  context "#execute" do
    it "the maximum total from top to bottom of the provided" do
      Problems::Problem18.execute.should eq 1074
    end
  end
end