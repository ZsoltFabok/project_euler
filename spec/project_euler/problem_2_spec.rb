require 'spec_helper'

describe Problem2 do
  before(:each) do
    @problem_2 = Problem2.new
  end

  it "the sum of even values in fibonacci from 1 to 5 should be 2" do
    @problem_2.execute(5).should eq 2
  end

  it "the sum of even values in fibonacci from 1 to 8 should be 10" do
    @problem_2.execute(8).should eq 10
  end

  it "the sum of even values in fibonacci from 1 to 13 should be 10" do
    @problem_2.execute(13).should eq 10
  end

  it "the sum of even values in fibonacci from 1 to 13 should be 4613732" do
    @problem_2.execute(4000000).should eq 4613732
  end
end