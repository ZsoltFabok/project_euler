require 'spec_helper'

describe Problems::Problem14 do
	subject(:problem) {Problems::Problem14.new}

	context "#calculate" do
		it "returns 1 for 1 because of 1 (1)" do
			problem.calculate(1).should eq 1
		end

		it "returns 3 for 4 because of 3 (3, 10, 5, 16, 8, 4, 2, 1)" do
			problem.calculate(4).should eq 3
		end
	end

	context "#execute" do
		it "returns the starting number of the longest collatz sequence under 1 million", slow: true do
			Problems::Problem14.execute.should eq 837799
		end
	end
end