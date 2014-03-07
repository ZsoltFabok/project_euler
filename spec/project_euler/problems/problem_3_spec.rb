require 'spec_helper'

describe Problems::Problem3 do
  subject(:problem) {Problems::Problem3.new}

  it "should return 2 as the largest prime factor of 2" do
    problem.execute(2).should eq 2
  end

  it "should return 3 as the largest prime factor of 6" do
    problem.execute(6).should eq 3
  end

  it "should return 7 as the largest prime factor of 7" do
    problem.execute(7).should eq 7
  end

  it "should return 29 as the largest prime factor of 13195" do
    problem.execute(13195).should eq 29
  end

  it "should return 29 as the largest prime factor of 13195" do
    problem.execute(600851475143).should eq 6857
  end
end