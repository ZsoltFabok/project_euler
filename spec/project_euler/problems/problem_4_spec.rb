require 'spec_helper'

describe Problems::Problem4 do
  context "#calculate" do
    let(:number) {double}
    subject(:problem) {Problems::Problem4.new(number)}

    it "returns 9009 as the largest palindrome made from the product of two 2-digit numbers (91,99)" do
      allow(number).to receive(:is_palindromic?).and_return(false)
      expect(number).to receive(:is_palindromic?).with(9009).and_return(true)
      expect(problem.calculate(2)).to eq 9009
    end
  end

  context "#execute" do
    it "return 906609 as the largest palindrome made from the product of two 3-digit numbers (913,993)", slow: true do
      expect(Problems::Problem4.execute).to eq 906609
    end
  end
end