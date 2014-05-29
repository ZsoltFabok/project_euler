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

    describe "#divisors" do
      it "returns [1,2,5,10] for 10" do
        prime_factors.should_receive(:factors).with(10).and_return([2,5])
        arrays.should_receive(:multiply).with([2,5]).and_return(10)
        divisors.get(10).should eq [1,2,5,10]
      end

      it "returns [1, 2, 4, 8, 16] for 16" do
        prime_factors.should_receive(:factors).with(16).and_return([2, 2, 2, 2])
        arrays.should_receive(:multiply).with([2,2]).exactly(6).times.and_return(4)
        arrays.should_receive(:multiply).with([2,2,2]).exactly(4).times.and_return(8)
        arrays.should_receive(:multiply).with([2,2,2,2]).and_return(16)
        divisors.get(16).should eq [1, 2, 4, 8, 16]
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