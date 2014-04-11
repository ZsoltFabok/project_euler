require 'spec_helper'

describe Math::CollatzSequence do
	context "unit" do
		subject(:collatz_sequence) {Math::CollatzSequence.new}

		it "returns [1] for 1" do
			collatz_sequence.get(1).should eq [1]
		end

		it "returns [2,1] for 2" do
			collatz_sequence.get(2).should eq [2, 1]
		end

		it "returns [3, 10, 5, 16, 8, 4, 2, 1] for 3" do
			collatz_sequence.get(3).should eq [3, 10, 5, 16, 8, 4, 2, 1]
		end
	end

	context "integration" do
		subject(:collatz_sequence) {Math::CollatzSequence.new}

		it "returns N for x" do
		end
	end
end