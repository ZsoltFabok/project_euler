require 'spec_helper'

describe Problem2 do
  subject(:problem) {Problem2.new}

  it "the sum of even values in fibonacci from 1 to 5 should be 2" do
    problem.execute(5).should eq 2
  end

  it "the sum of even values in fibonacci from 1 to 8 should be 10" do
    problem.execute(8).should eq 10
  end

  it "the sum of even values in fibonacci from 1 to 13 should be 10" do
    problem.execute(13).should eq 10
  end

  it "the sum of even values in fibonacci from 1 to 13 should be 4613732" do
    problem.execute(4000000).should eq 4613732
  end
end