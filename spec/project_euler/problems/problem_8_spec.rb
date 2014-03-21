require 'spec_helper'

describe Problems::Problem8 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem8.new(arrays)}

    it "returns 7560 (79385) as the greatest product of five consecutive digits in 793856" do
      arrays.should_receive(:multiply).with([7, 9, 3, 8, 5]).and_return(7560)
      arrays.should_receive(:multiply).with([9, 3, 8, 5, 6]).and_return(6480)
      arrays.should_receive(:multiply).with([3, 8, 5, 6]).and_return(720)
      arrays.should_receive(:multiply).with([8, 5, 6]).and_return(240)
      arrays.should_receive(:multiply).with([5, 6]).and_return(30)
      arrays.should_receive(:multiply).with([6]).and_return(6)
      problem.calculate("793856").should eq 7560
    end
  end

  context "#execute" do
    it "returns X for the 1000 long number given in the problem" do
      Problems::Problem8.execute.should eq 40824
    end
  end
end