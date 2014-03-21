require 'spec_helper'

describe Problems::Problem2 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem2.new(arrays)}

    it "the sum of even values in fibonacci from 1 to 5 is 2" do
      arrays.should_receive(:sum).with([1, 1]).and_return 2
      arrays.should_receive(:sum).with([1, 2]).and_return 3
      arrays.should_receive(:sum).with([2, 3]).and_return 5
      problem.calculate(5).should eq 2
    end
  end

  context "#execute" do
    it "the sum of even values in fibonacci from 1 to 13 is 4613732" do
      Problems::Problem2.execute.should eq 4613732
    end
  end
end