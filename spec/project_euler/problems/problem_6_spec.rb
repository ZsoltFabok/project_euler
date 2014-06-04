require 'spec_helper'

describe Problems::Problem6 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem6.new(arrays)}

    it "returns 2640 (3025 - 385) for 10" do
      expect(arrays).to receive(:sum).with([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).and_return(55)
      expect(arrays).to receive(:sum).with([1, 4, 9, 16, 25, 36, 49, 64, 81, 100]).and_return(385)
      expect(problem.calculate(10)).to eq 2640
    end
  end

  context "#execute" do
    it "returns 25164150 (25502500 - 338350) for 100" do
      expect(Problems::Problem6.execute).to eq 25164150
    end
  end
end