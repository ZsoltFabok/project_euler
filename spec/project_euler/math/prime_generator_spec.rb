require 'spec_helper'

describe Math::PrimeGenerator do
  context "unit" do
    subject(:generator) {Math::PrimeGenerator.new}

    it "returns primes below 10" do
      expect(generator.primes(10)).to eq [2, 3, 5, 7]
    end

    it "returns primes below 20" do
      expect(generator.primes(20)).to eq [2, 3, 5, 7, 11, 13, 17, 19]
    end

    it "returns primes below 100" do
      expect(generator.primes(100)).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
                                       41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    end
  end
end