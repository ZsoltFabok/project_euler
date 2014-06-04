require 'spec_helper'

describe Math::BinaryGcd do
  context "unit" do
    subject(:gcd) {Math::BinaryGcd.new}

    it "returns 2 as gcd of 2 and 4" do
      expect(gcd.gcd(2, 4)).to eq 2
    end

    it "returns 2 as gcd of 4 and 2 (interchangeability)" do
      expect(gcd.gcd(9, 3)).to eq 3
    end

    it "returns 3 as gcd of 9 and 3 (wikipedia example)" do
      expect(gcd.gcd(3, 9)).to eq 3
    end

    it "returns 6 as gcd of 18 and 84 (wikipedia example)" do
      expect(gcd.gcd(18, 84)).to eq 6
    end

    it "returns 12 as gcd of 48 and 180 (wikipedia example)" do
      expect(gcd.gcd(48, 180)).to eq 12
    end

    it "returns 1 as gcd of 7 and 5 (both are primes)" do
      expect(gcd.gcd(7, 5)).to eq 1
    end
  end
end