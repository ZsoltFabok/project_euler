require 'spec_helper'

describe Problems::Problem9 do
  subject(:problem) {Problems::Problem9.new}

  it "returns 60 (3*4*5) for 12 (3+4+5)" do
    problem.calculate(12).should eq 60
  end

  it "returns 31875000 (200*375*425) for 1000 (200+375+425)" do
    problem.calculate(1000).should eq 31875000
  end
end