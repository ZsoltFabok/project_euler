require 'spec_helper'

describe Attic::TriangleNumbers do
  context "#next" do
  	let(:arrays) {double}
    subject(:triangle_numbers) {Attic::TriangleNumbers.create}

    it "returns the next triangle number" do
      triangle_numbers.next.should eq 1
      triangle_numbers.next.should eq 3
      triangle_numbers.next.should eq 6
    end
  end
end