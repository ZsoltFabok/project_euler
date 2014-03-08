require 'spec_helper'

describe Problems::Problem4 do
  subject(:problem) {Problems::Problem4.new}

  it "should return 9009 largest palindrome made from the product of two 2-digit numbers (91,99)" do
    problem.execute(2).should eq 9009
  end

  it "should return 906609 largest palindrome made from the product of two 3-digit numbers (913,993)" do
    problem.execute(3).should eq 906609
  end
end