require 'spec_helper'

describe Math::PrimeFactors do
  context "unit" do
    let(:prime_enumerator) {double}
    subject(:factors) {Math::PrimeFactors.new(prime_enumerator)}

  	describe "#factors" do
      it "returns [2] for 2 and does not use the enumerator because 2 is default first prime" do
        prime_enumerator.should_receive(:reset)
        prime_enumerator.should_not_receive(:next)
        factors.factors(2).should eq [2]
      end

      it "returns [2, 3, 11, 11, 13] for 9438" do
        prime_enumerator.should_receive(:reset)
        prime_enumerator.should_receive(:next).and_return(2, 3, 11, 13)
        factors.factors(9438).should eq [2, 3, 11, 11, 13]
      end
    end
  end

  context "integration" do
    subject(:factors) {Math::PrimeFactors.create}

    it "returns [5, 7, 13, 29] for 13195" do
      factors.factors(13195).should eq [5, 7, 13, 29]
    end

    it "returns [11, 90709] for 997799", slow: true do
      factors.factors(997799).should eq [11, 90709]
    end
  end
end