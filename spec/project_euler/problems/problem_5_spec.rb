require 'spec_helper'

describe Problems::Problem5 do
  context "#calculate" do
    let(:prime) {double}
    let(:arrays) {double}
    subject(:problem) {Problems::Problem5.new(prime, arrays)}

    it "2520 is the smallest number that can be divided by each of the numbers from 1 to 10" do
      factors = {1 => [1], 2 => [2], 3 => [3], 4 => [2, 2], 5 => [5], 6 => [2, 3],
                 7 => [7], 8 => [2, 2, 2], 9 => [3, 3], 10 => [2, 5]}
      factors.each do |number, factor|
        prime.should_receive(:factorisation).with(number).and_return(factor)
      end
      arrays.should_receive(:multiply).with([1]).and_return(1)
      arrays.should_receive(:multiply).with([2, 2, 2, 2, 2, 2, 2, 2]).and_return(2**8)
      arrays.should_receive(:multiply).with([2, 2, 2, 2, 2, 2, 2]).and_return(2**7)
      arrays.should_receive(:multiply).with([2, 2, 2, 2, 2, 2]).and_return(2**6)
      arrays.should_receive(:multiply).with([2, 2, 2, 2, 2]).and_return(2**5)
      arrays.should_receive(:multiply).with([2, 2, 2, 2]).and_return(2**4)
      arrays.should_receive(:multiply).with([2, 2, 2]).and_return(2**3)
      arrays.should_receive(:multiply).with([3, 3, 3, 3]).and_return(3**4)
      arrays.should_receive(:multiply).with([3, 3, 3]).and_return(3**3)
      arrays.should_receive(:multiply).with([3, 3]).and_return(3**2)
      arrays.should_receive(:multiply).with([5, 5]).and_return(5**2)
      arrays.should_receive(:multiply).with([5]).and_return(5**1)
      arrays.should_receive(:multiply).with([7]).and_return(7**1)
      arrays.should_receive(:multiply).with([1, 2, 2, 2, 3, 3, 5, 7]).and_return(2520)

      problem.calculate(10).should eq 2520
    end
  end

  context "#execute" do
    it "232792560 is the smallest number that can be divided by each of the numbers from 1 to 20" do
      Problems::Problem5.execute.should eq 232792560
    end
  end
end