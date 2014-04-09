require 'spec_helper'

describe Math::PrimeChecker do
  context "#is_prime?" do
    subject(:checker) {Math::PrimeChecker.new}

    it "returns true for 2" do
      checker.is_prime?(2).should be_true
    end

    it "returns true for 3" do
      checker.is_prime?(3).should be_true
    end

    it "returns false for 9" do
      checker.is_prime?(9).should be_false
    end

    it "returns false for 341 (pseudoprime)" do
      checker.is_prime?(341).should be_false
    end
  end

  context "integration" do
    subject(:checker) {Math::PrimeChecker.create}
    it "returns true for 13" do
      checker.is_prime?(13).should be_true
    end
  end
end