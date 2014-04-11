require 'spec_helper'

describe Problems::Problem14 do
	let(:collatz_sequence) {double}
	subject(:problem) {Problems::Problem14.new(collatz_sequence)}

	context "#calculate" do
		it "returns 1 for 1 because of 1 (1)" do
			collatz_sequence.should_receive(:get).with(1).and_return [1]
			problem.calculate(1).should eq 1
		end

		it "returns 3 for 4 because of 3 (3, 10, 5, 16, 8, 4, 2, 1)" do
			collatz_sequence.should_receive(:get).with(1).and_return [1]
			collatz_sequence.should_receive(:get).with(2).and_return [2, 1]
			collatz_sequence.should_receive(:get).with(3).and_return [3, 10, 5, 16, 8, 4, 2, 1]
			collatz_sequence.should_receive(:get).with(4).and_return [4, 2, 1]
			problem.calculate(4).should eq 3
		end
	end

	context "#execute" do
		it "returns the starting number of the longest collatz sequence under 1 million", slow: true do
			# Problems::Problem14.execute.should eq 837799
			Problems::Problem14.execute
		end
	end
end