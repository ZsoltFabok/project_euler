require 'spec_helper'

describe Common::Arrays do
  subject(:arrays) {Common::Arrays.new}
  context "#sum" do
    it "returns the sum of elements of a given array" do
      expect(arrays.sum([1, 2, 3])).to eq 6
    end
  end

  context "#multiply" do
    it "multiplies elements of array" do
      expect(arrays.multiply([2,3,5])).to eq 30
    end
  end

  context "#binary_search" do
    it "finds 5 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(5, [2, 3, 4, 5, 7])).to eq 3
    end

    it "finds 4 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(4, [2, 3, 4, 5, 7])).to eq 2
    end

    it "finds 2 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(2, [2, 3, 4, 5, 7])).to eq 0
    end

    it "finds 7 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(7, [2, 3, 4, 5, 7])).to eq 4
    end

    it "finds 3 in [2, 3, 4, 5]" do
      expect(arrays.binary_search(3, [2, 3, 4, 5, 7])).to eq 1
    end

    it "doesn't find 8 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(8, [2, 3, 4, 5, 7])).to eq nil
    end

    it "doesn't find 1 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(1, [2, 3, 4, 5, 7])).to eq nil
    end

    it "doesn't find 6 in [2, 3, 4, 5, 7]" do
      expect(arrays.binary_search(6, [2, 3, 4, 5, 7])).to eq nil
    end

    it "returns nil for an empty array" do
      expect(arrays.binary_search(3, [])).to eq nil
    end
  end
end