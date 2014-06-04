require 'spec_helper'

describe Attic::Arrays do
  context "#variations" do
    it "should return all variations for an array with 2 elements" do
      expect(get_variations(["a", "b"])).to eq ["ab", "ba"]
    end

    it "should return all variations for an array with 3 elements" do
      expect(get_variations(["a", "b", "c"])).to eq ["abc", "acb", "bac", "bca", "cab", "cba"]
    end

    it "should return all variations for an array with 4 elements" do
      expect(get_variations(["a", "b", "c", "d"])).to eq [
                        "abcd", "abdc", "acbd", "acdb", "adbc", "adcb",
                        "bacd", "badc", "bcad", "bcda", "bdac", "bdca",
                        "cabd", "cadb", "cbad", "cbda", "cdab", "cdba",
                        "dabc", "dacb", "dbac", "dbca", "dcab", "dcba"]
    end

    def get_variations(array)
      Attic::Arrays.variations(array).map {|element| element.inject(:+)}
    end
  end
end