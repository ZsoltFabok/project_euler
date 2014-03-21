require 'spec_helper'

describe Problems::Problem6 do

  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem6.new(arrays)}

    it "returns 2640 (3025 - 385) for 10" do
      arrays.should_receive(:sum).with([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).and_return(55)
      arrays.should_receive(:sum).with([1, 4, 9, 16, 25, 36, 49, 64, 81, 100]).and_return(385)
      problem.calculate(10).should eq 2640
    end
  end

  context "#execute" do
    it "returns 25164150 (25502500 - 338350) for 100" do
      Problems::Problem6.execute.should eq 25164150
    end
  end
end