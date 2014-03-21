require 'spec_helper'

describe Problems::Problem7 do
  context "#calculate" do
    let(:prime) {double}
    subject(:problem) {Problems::Problem7.new(prime)}

    it "returns 13 as the 6th prime number" do
      prime.should_receive(:number_of_known_primes).exactly(3).times.and_return(5, 5, 6)
      prime.should_receive(:next_unknown_prime).and_return(13)
      prime.should_receive(:prime_at_position).with(5).and_return(13)
      problem.calculate(6).should eq 13
    end
  end

  context "#execute" do
    it "returns 104743 as the 10001st prime number" do
      Problems::Problem7.execute.should eq 104743
    end
  end
end