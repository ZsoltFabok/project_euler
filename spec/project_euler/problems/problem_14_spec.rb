require 'spec_helper'

describe Problems::Problem14 do
  context "#calculate" do
  	subject(:problem) {Problems::Problem14.new}

		it "returns 1 for 1 because of 1 (1)" do
			expect(problem.calculate(1)).to eq 1
		end

		it "returns 3 for 4 because of 3 (3, 10, 5, 16, 8, 4, 2, 1)" do
			expect(problem.calculate(4)).to eq 3
		end
	end

	context "#execute" do
		it "returns the starting number of the longest collatz sequence under 1 million", slow: true do
			expect(Problems::Problem14.execute).to eq 837799
		end
	end
end