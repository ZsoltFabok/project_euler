require 'spec_helper'

describe Problems::Problem18 do

  context "#calculate" do
    subject(:problem) {Problems::Problem18.new}

    it "returns 3 for 3" do
      expect(problem.calculate("3")).to eq 3
    end

    it "returns 10 for [3][7,4]]" do
      expect(problem.calculate("3 7 4")).to eq 10
    end

    it "returns 14 for [3],[7,4],[2,4,6]]" do
      expect(problem.calculate("3 7 4 2 4 6")).to eq 14
    end

    it "returns 23 for [3],[7,4],[2,4,6],[8,5,9,3]]" do
      expect(problem.calculate("3 7 4 2 4 6 8 5 9 3")).to eq 23
    end
  end

  context "#execute" do
    it "the maximum total from top to bottom of the provided triangle" do
      expect(Problems::Problem18.execute).to eq 1074
    end
  end
end