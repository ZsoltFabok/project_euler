require 'spec_helper'

describe Math::Divisors do
  context "unit" do
    let(:prime_factors) {double}
    let(:arrays) {double}
    subject(:divisors) {Math::Divisors.new(prime_factors, arrays)}

    describe "#number_of_divisors" do
      it "returns 2 for 2" do
        prime_factors.should_receive(:factors).with(2).and_return([2])
        arrays.should_receive(:multiply).with([2]).and_return(2)
        divisors.number_of_divisors(2).should eq 2
      end

      it "returns 6 for 28" do
        prime_factors.should_receive(:factors).with(28).and_return([2,2,3])
        arrays.should_receive(:multiply).with([3,2]).and_return(6)
        divisors.number_of_divisors(28).should eq 6
      end
    end
  end

  context "integration" do
    subject(:divisors) {Math::Divisors.create}

    it "returns 4 for 6" do
      divisors.number_of_divisors(6).should eq 4
    end
  end
end