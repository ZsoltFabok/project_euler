require 'spec_helper'

describe Math::PrimeFactors do
  context "unit" do
    let(:prime_enumerator) {double}
    subject(:factors) {Math::PrimeFactors.new(prime_enumerator)}

  	describe "#factors" do
      it "returns [2] for 2 and does not use the enumerator because 2 is default first prime" do
        expect(prime_enumerator).to receive(:reset)
        expect(prime_enumerator).not_to receive(:next)
        expect(factors.factors(2)).to eq [2]
      end

      it "returns [2, 3, 11, 11, 13] for 9438" do
        expect(prime_enumerator).to receive(:reset)
        expect(prime_enumerator).to receive(:next).and_return(2, 3, 11, 13)
        expect(factors.factors(9438)).to eq [2, 3, 11, 11, 13]
      end
    end
  end

  context "integration" do
    subject(:factors) {Math::PrimeFactors.create}

    it "returns [5, 7, 13, 29] for 13195" do
      expect(factors.factors(13195)).to eq [5, 7, 13, 29]
    end

    it "returns [11, 90709] for 997799", slow: true do
      expect(factors.factors(997799)).to eq [11, 90709]
    end
  end
end