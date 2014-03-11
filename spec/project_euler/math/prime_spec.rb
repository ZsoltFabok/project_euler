require 'spec_helper'

describe Math::Prime do
  context "#factorisation" do
    subject(:prime) {Math::Prime.new}

    it "returns [2] for 2" do
      prime.factorisation(2).should eq [2]
    end

    it "returns [2, 3, 11, 11, 13] for 9438" do
      prime.factorisation(9438).should eq [2, 3, 11, 11, 13]
    end

    it "returns [5, 7, 13, 29] for 13195" do
      prime.factorisation(13195).should eq [5, 7, 13, 29]
    end

    it "returns [11, 90709] for 997799", slow: true do
      prime.factorisation(997799).should eq [11, 90709]
    end
  end

  context "#is_prime?" do
    subject(:prime) {Math::Prime.new}

    it "returns true for 3" do
      prime.is_prime?(3).should be_true
    end

    it "returns false for 9" do
      prime.is_prime?(9).should be_false
    end

    it "returns false for 341 (pseudoprime)" do
      prime.is_prime?(341).should be_false
    end
  end
end