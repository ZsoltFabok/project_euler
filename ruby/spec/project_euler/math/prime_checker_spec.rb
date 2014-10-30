require 'spec_helper'

describe Math::PrimeChecker do
  context "#is_prime?" do
    subject(:checker) {Math::PrimeChecker.new}

    it "returns true for 2" do
      expect(checker.is_prime?(2)).to be true
    end

    it "returns true for 3" do
      expect(checker.is_prime?(3)).to be true
    end

    it "returns false for 9" do
      expect(checker.is_prime?(9)).to be false
    end

    it "returns false for 341 (pseudoprime)" do
      expect(checker.is_prime?(341)).to be false
    end
  end

  context "integration" do
    subject(:checker) {Math::PrimeChecker.create}
    it "returns true for 13" do
      expect(checker.is_prime?(13)).to be true
    end
  end
end