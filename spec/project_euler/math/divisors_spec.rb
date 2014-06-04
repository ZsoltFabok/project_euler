require 'spec_helper'

describe Math::Divisors do
  context "unit" do
    let(:prime_factors) {double}
    let(:arrays) {double}
    subject(:divisors) {Math::Divisors.new(prime_factors, arrays)}

    describe "#number_of_divisors" do
      it "returns 2 for 2" do
        expect(prime_factors).to receive(:factors).with(2).and_return([2])
        expect(arrays).to receive(:multiply).with([2]).and_return(2)
        expect(divisors.number_of_divisors(2)).to eq 2
      end

      it "returns 6 for 28" do
        expect(prime_factors).to receive(:factors).with(28).and_return([2,2,3])
        expect(arrays).to receive(:multiply).with([3,2]).and_return(6)
        expect(divisors.number_of_divisors(28)).to eq 6
      end
    end

    describe "#divisors" do
      it "returns [1,2,5,10] for 10" do
        expect(prime_factors).to receive(:factors).with(10).and_return([2,5])
        expect(arrays).to receive(:multiply).with([2,5]).and_return(10)
        expect(divisors.get(10)).to eq [1,2,5,10]
      end

      it "returns [1, 2, 4, 8, 16] for 16" do
        expect(prime_factors).to receive(:factors).with(16).and_return([2, 2, 2, 2])
        expect(arrays).to receive(:multiply).with([2,2]).exactly(6).times.and_return(4)
        expect(arrays).to receive(:multiply).with([2,2,2]).exactly(4).times.and_return(8)
        expect(arrays).to receive(:multiply).with([2,2,2,2]).and_return(16)
        expect(divisors.get(16)).to eq [1, 2, 4, 8, 16]
      end
    end
  end

  context "integration" do
    subject(:divisors) {Math::Divisors.create}

    it "returns 4 for 6" do
      expect(divisors.number_of_divisors(6)).to eq 4
    end
  end
end