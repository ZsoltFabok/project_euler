require 'spec_helper'

describe Problems::Problem17 do
  let(:number) {double}
  subject(:problem) {Problems::Problem17.new(number)}

  context "#calculate" do
    it "returns 19 for 1 to 5 (3 + 3 + 5 + 4 + 4 = 19)" do
      expect(number).to receive(:in_letters).with(1).and_return("one")
      expect(number).to receive(:in_letters).with(2).and_return("two")
      expect(number).to receive(:in_letters).with(3).and_return("three")
      expect(number).to receive(:in_letters).with(4).and_return("four")
      expect(number).to receive(:in_letters).with(5).and_return("five")
      expect(problem.calculate(5)).to eq 19
    end
  end

  context "#execute" do
    it "returns the number of letters if all the numbers from 1 to 1000 (one thousand) inclusive were written out in words" do
      expect(Problems::Problem17.execute).to eq 21124
    end
  end
end