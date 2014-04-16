require 'spec_helper'

describe Problems::Problem16 do
  let(:arrays) {double}
  subject(:problem) {Problems::Problem16.new(arrays)}

  context "#calculate" do
    it "returns 26 as the sum of the digits of the number 2^15" do
      arrays.should_receive(:sum).with([3,2,7,6,8]).and_return(26)
      problem.calculate(15).should eq 26
    end
  end

  context "#execute" do
    it "returns 1366 as the sum of the digits of the number 2^1000" do
      Problems::Problem16.execute.should eq 1366
    end
  end
end