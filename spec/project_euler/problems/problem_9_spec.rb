require 'spec_helper'

describe Problems::Problem9 do
  subject(:problem) {Problems::Problem9.new}

  context "#calculate" do
    it "returns 60 (3*4*5) for 12 (3+4+5)" do
      problem.calculate(12).should eq 60
    end
  end

  context "#execute" do
    it "returns 31875000 (200*375*425) for 1000 (200+375+425)" do
      problem.execute.should eq 31875000
    end
  end
end