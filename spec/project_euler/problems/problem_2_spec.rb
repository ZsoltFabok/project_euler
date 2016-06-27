require 'spec_helper'

describe Problems::Problem2 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem2.new(arrays)}

    it "the sum of even values in fibonacci from 1 to 5 is 2" do
      expect(arrays).to receive(:sum).with([1, 1]).and_return 2
      expect(arrays).to receive(:sum).with([1, 2]).and_return 3
      expect(arrays).to receive(:sum).with([2, 3]).and_return 5
      expect(problem.calculate(5)).to eq 2
    end
  end

  context "#execute" do
    it "the sum of even values in fibonacci from 1 to 13 is 4613732" do
      expect(Problems::Problem2.execute).to eq 4613732
    end
  end
end