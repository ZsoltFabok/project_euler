require 'spec_helper'

describe Problems::Problem4 do
  subject(:problem) {Problems::Problem4.new}

  context "#calculate" do
    it "returns 9009 as the largest palindrome made from the product of two 2-digit numbers (91,99)" do
      problem.calculate(2).should eq 9009
    end
  end

  context "#execute" do
    it "return 906609 as the largest palindrome made from the product of two 3-digit numbers (913,993)", slow: true do
      problem.execute.should eq 906609
    end
  end
end