require 'spec_helper'

describe Problems::Problem7 do
  subject(:problem) {Problems::Problem7.new}

  it "does return 13 as the 6th prime number" do
    problem.execute(6).should eq 13
  end

  it "does return 541 as the 100th prime number" do
    problem.execute(100).should eq 541
  end

  it "does return 3581 as the 500th prime number" do
    problem.execute(500).should eq 3571
  end

  it "does return 7919 as the 1000th prime number" do
    problem.execute(1000).should eq 7919
  end

  it "does return 104743 as the 10001st prime number" do
    problem.execute(10001).should eq 104743
  end
end