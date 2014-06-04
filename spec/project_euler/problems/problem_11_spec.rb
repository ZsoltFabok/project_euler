require 'spec_helper'

describe Problems::Problem11 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem11.new(arrays)}

    it "returns 625 as a vertical match for the grid below" do
      grid = "00 00 00 00 00 05 00
              00 00 00 00 00 05 00
              00 00 00 00 00 05 00
              00 00 00 00 00 05 00
              00 00 00 00 00 00 00
              00 00 00 00 00 05 00
              00 00 00 00 00 05 00"
      allow(arrays).to receive(:multiply).and_return 1
      expect(arrays).to receive(:multiply).with([5, 5, 5, 5]).and_return(5**4)
      expect(problem.calculate(grid)).to eq 5**4
    end

    it "returns 625 as a horisontal match for the grid below" do
      grid = "00 00 00 00 00 00 00
              00 00 00 00 00 00 00
              00 00 00 00 00 00 00
              00 00 00 00 00 00 00
              00 00 00 00 00 00 00
              00 00 00 00 00 00 00
              00 00 05 05 05 05 00"
      allow(arrays).to receive(:multiply).and_return 1
      expect(arrays).to receive(:multiply).with([5, 5, 5, 5]).and_return(5**4)
      expect(problem.calculate(grid)).to eq 5**4
    end

    it "returns 625 as a diagonal up match for the grid below" do
      grid = "00 00 00 00 00 05 00
              00 00 00 00 05 00 00
              00 00 00 05 00 05 00
              00 00 05 00 00 05 00
              00 00 00 00 00 00 00
              00 00 00 00 00 05 00
              00 00 00 00 00 05 00"
      allow(arrays).to receive(:multiply).and_return 1
      expect(arrays).to receive(:multiply).with([5, 5, 5, 5]).and_return(5**4)
      expect(problem.calculate(grid)).to eq 5**4
    end

    it "returns 32719995 for the grid below ([49, 95, 71, 99])" do
      grid = "08 02 22 97 38 15 00
              49 49 99 40 17 81 18
              81 49 31 73 55 79 14
              52 70 95 23 04 60 11
              22 31 16 71 51 67 63
              24 47 32 60 99 03 45
              32 98 81 28 64 23 69"
      allow(arrays).to receive(:multiply).and_return 1
      expect(arrays).to receive(:multiply).with([49, 95, 71, 99]).and_return(32719995)
      expect(problem.calculate(grid)).to eq 32719995
    end
  end

  context "#execute" do
    it "returns 70600674 for the grid" do
      expect(Problems::Problem11.execute).to eq 70600674
    end
  end
end