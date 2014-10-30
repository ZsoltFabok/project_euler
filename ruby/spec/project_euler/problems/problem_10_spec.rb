require 'spec_helper'

describe Problems::Problem10 do
  context "#calculate" do
    let(:prime_generator) {double}
    subject(:problem) {Problems::Problem10.new(prime_generator)}

    it "the sum of the primes below 10 is 17" do
      expect(prime_generator).to receive(:primes).with(10).and_return([2, 3, 5, 7])
      expect(problem.calculate(10)).to eq 17
    end
  end

  context "#execute" do
    it "the sum of the primes below 2000000 is 142913828922", slow: true do
      expect(Problems::Problem10.execute).to eq 142913828922
    end
  end
end