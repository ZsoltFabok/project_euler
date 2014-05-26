require 'spec_helper'

describe Problems::Problem20 do
  let(:arrays) {double}
  let(:factorial) {double}
  let(:number) {double}
  subject(:problem) {Problems::Problem20.new(arrays, factorial, number)}

  context "#calculate" do
    it "returns 2 for 2!" do
      factorial.should_receive(:get).with(2).and_return(2)
      number.should_receive(:digits).with(2).and_return([2])
      arrays.should_receive(:sum).with([2]).and_return(2)
      problem.calculate(2).should eq 2
    end

    it "returns 27 for 10! (3628800, 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27)" do
      factorial.should_receive(:get).with(10).and_return(3628800)
      number.should_receive(:digits).with(3628800).and_return([3,6,2,8,8,0,0])
      arrays.should_receive(:sum).with([3,6,2,8,8,0,0]).and_return(27)
      problem.calculate(10).should eq 27
    end
  end

  context "#execute" do
    it "648 sum of the digits of 100!" do
      Problems::Problem20.execute.should eq 648
    end
  end
end