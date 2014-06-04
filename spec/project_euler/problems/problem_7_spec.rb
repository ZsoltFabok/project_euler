require 'spec_helper'

describe Problems::Problem7 do
  context "#calculate" do
    let(:prime) {double}
    subject(:problem) {Problems::Problem7.new(prime)}

    it "returns 13 as the 6th prime number" do
      expect(prime).to receive(:next).and_return(2, 3, 5, 7, 11, 13)
      expect(problem.calculate(6)).to eq 13
    end
  end

  context "#execute" do
    it "returns 104743 as the 10001st prime number", slow: true do
      expect(Problems::Problem7.execute).to eq 104743
    end
  end
end