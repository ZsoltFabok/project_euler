require 'spec_helper'

describe Problems::Problem20 do

  context "#calculate" do
    let(:arrays) {double}
    let(:factorial) {double}
    let(:number) {double}
    subject(:problem) {Problems::Problem20.new(arrays, factorial, number)}

    it "returns 2 for 2!" do
      expect(factorial).to receive(:get).with(2).and_return(2)
      expect(number).to receive(:digits).with(2).and_return([2])
      expect(arrays).to receive(:sum).with([2]).and_return(2)
      expect(problem.calculate(2)).to eq 2
    end

    it "returns 27 for 10! (3628800, 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27)" do
      expect(factorial).to receive(:get).with(10).and_return(3628800)
      expect(number).to receive(:digits).with(3628800).and_return([3,6,2,8,8,0,0])
      expect(arrays).to receive(:sum).with([3,6,2,8,8,0,0]).and_return(27)
      expect(problem.calculate(10)).to eq 27
    end
  end

  context "#execute" do
    it "648 sum of the digits of 100!" do
      expect(Problems::Problem20.execute).to eq 648
    end
  end
end