require 'spec_helper'

describe Problems::Problem8 do
  context "#calculate" do
    let(:arrays) {double}
    let(:number) {double}
    subject(:problem) {Problems::Problem8.new(arrays, number)}

    it "returns 7560 (79385) as the greatest product of five consecutive digits in 793856" do
      expect(arrays).to receive(:multiply).with([7, 9, 3, 8, 5]).and_return(7560)
      expect(number).to receive(:digits).with(793856).and_return([7, 9, 3, 8, 5, 6])
      expect(arrays).to receive(:multiply).with([9, 3, 8, 5, 6]).and_return(6480)
      expect(arrays).to receive(:multiply).with([3, 8, 5, 6]).and_return(720)
      expect(arrays).to receive(:multiply).with([8, 5, 6]).and_return(240)
      expect(arrays).to receive(:multiply).with([5, 6]).and_return(30)
      expect(arrays).to receive(:multiply).with([6]).and_return(6)
      expect(problem.calculate("793856")).to eq 7560
    end
  end

  context "#execute" do
    it "returns X for the 1000 long number given in the problem" do
      expect(Problems::Problem8.execute).to eq 40824
    end
  end
end