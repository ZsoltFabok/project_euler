require 'spec_helper'

describe Problems::Problem21 do
  let(:divisors) {double}
  let(:arrays) {double}
  subject(:problem) {Problems::Problem21.new(divisors, arrays)}

  context "#calculate" do
    it "0 is the sum of all the amicable numbers under 4" do
      divisors.should_receive(:get).with(2).and_return([1, 2])
      divisors.should_receive(:get).with(3).and_return([1, 3])
      divisors.should_receive(:get).with(4).and_return([1, 2, 4])
      arrays.should_receive(:sum).with([1, 2]).and_return(2)
      problem.calculate(4).should eq 0
    end
  end

  context "#execute" do
    it "31626 is the sum of all the amicable numbers under 10000", slow: true do
      Problems::Problem21.execute.should eq 31626
    end
  end
end