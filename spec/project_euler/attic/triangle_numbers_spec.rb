require 'spec_helper'

describe Attic::TriangleNumbers do
  context "#next" do
  	let(:arrays) {double}
    subject(:triangle_numbers) {Attic::TriangleNumbers.create}

    it "returns the next triangle number" do
      expect(triangle_numbers.next).to eq 1
      expect(triangle_numbers.next).to eq 3
      expect(triangle_numbers.next).to eq 6
    end
  end
end