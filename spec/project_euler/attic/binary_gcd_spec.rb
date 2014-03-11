require 'spec_helper'

describe Math::BinaryGcd do
  subject(:gcd) {Math::BinaryGcd.new}
  it "returns 2 as gcd of 2 and 4" do
    gcd.gcd(2, 4).should eq 2
  end

  it "returns 2 as gcd of 4 and 2 (interchangeability)" do
    gcd.gcd(9, 3).should eq 3
  end

  it "returns 3 as gcd of 9 and 3 (wikipedia example)" do
    gcd.gcd(3, 9).should eq 3
  end

  it "returns 6 as gcd of 18 and 84 (wikipedia example)" do
    gcd.gcd(18, 84).should eq 6
  end

  it "returns 12 as gcd of 48 and 180 (wikipedia example)" do
    gcd.gcd(48, 180).should eq 12
  end

  it "returns 1 as gcd of 7 and 5 (both are primes)" do
    gcd.gcd(7, 5).should eq 1
  end
end