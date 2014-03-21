require 'spec_helper'

describe Problems::Problem1 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem1.new(arrays)}

    it "multiples of 3 and 5 should give 23 under 10" do
      arrays.should_receive(:sum).with([3, 5, 6, 9]).and_return(23)
      problem.calculate(10).should eq 23
    end
  end

  context "#execute" do
    it "multiples of 3 and 5 should give 233168 under 1000" do
      Problems::Problem1.execute.should eq 233168
    end
  end
end