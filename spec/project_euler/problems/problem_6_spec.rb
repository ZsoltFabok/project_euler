require 'spec_helper'

describe Problems::Problem6 do
  subject(:problem) {Problems::Problem6.new}

  it "should return is 2640 (3025 - 385) for 10" do
    problem.execute(10).should eq 2640
  end

  it "should return is 25164150 (25502500 - 338350) for 100" do
    problem.execute(100).should eq 25164150
  end
end