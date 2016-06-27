require 'spec_helper'

describe Problems::Problem3 do
  context "#calculate" do
    let(:primes) {double}
    subject(:problem) {Problems::Problem3.new(primes)}

    it "should return 29 as the largest prime factor of 13195" do
      expect(primes).to receive(:factors).with(13195).and_return([5, 7, 13, 29])
      expect(problem.calculate(13195)).to eq 29
    end
  end

  context "#execute" do
    it "should return 6857 as the largest prime factor of 600851475143", slow: true do
      expect(Problems::Problem3.execute).to eq 6857
    end
  end
end