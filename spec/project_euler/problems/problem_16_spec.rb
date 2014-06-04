require 'spec_helper'

describe Problems::Problem16 do
  let(:arrays) {double}
  let(:number) {double}
  subject(:problem) {Problems::Problem16.new(arrays, number)}

  context "#calculate" do
    it "returns 26 as the sum of the digits of the number 2^15" do
      expect(arrays).to receive(:sum).with([3,2,7,6,8]).and_return(26)
      expect(number).to receive(:digits).with(32768).and_return([3,2,7,6,8])
      expect(problem.calculate(15)).to eq 26
    end
  end

  context "#execute" do
    it "returns 1366 as the sum of the digits of the number 2^1000" do
      expect(Problems::Problem16.execute).to eq 1366
    end
  end
end