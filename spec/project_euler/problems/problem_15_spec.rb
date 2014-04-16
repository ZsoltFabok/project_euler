require 'spec_helper'

describe Problems::Problem15 do
	subject(:problem) {Problems::Problem15.new}

	context "#calculate" do
		it "returns 2 for a 1x1 grid" do
			problem.calculate(1).should eq 2
		end

		it "returns 6 for a 2x2 grid" do
			problem.calculate(2).should eq 6
		end

		it "returns 20 for a 3x3 grid" do
			problem.calculate(3).should eq 20
		end
	end

	context "#execute" do
		it "finds 137846528820 routes in a 20x20 grid" do
			Problems::Problem15.execute.should eq 137846528820
		end
	end
end