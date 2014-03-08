require 'spec_helper'

describe Common::Arrays do
  context "#sum" do
    it "should return the sum of elements of a given array" do
      Common::Arrays.sum([1, 2, 3]).should eq 6
    end
  end

  context "#variations" do
    it "#variations should return all variations for an array with 2 elements" do
      get_variations(["a", "b"]).should eq ["ab", "ba"]
    end

    it "#variations should return all variations for an array with 3 elements" do
      get_variations(["a", "b", "c"]).should eq ["abc", "acb", "bac", "bca", "cab", "cba"]
    end

    it "#variations should return all variations for an array with 4 elements" do
      get_variations(["a", "b", "c", "d"]).should eq [
                        "abcd", "abdc", "acbd", "acdb", "adbc", "adcb",
                        "bacd", "badc", "bcad", "bcda", "bdac", "bdca",
                        "cabd", "cadb", "cbad", "cbda", "cdab", "cdba",
                        "dabc", "dacb", "dbac", "dbca", "dcab", "dcba"]
    end

    def get_variations(array)
      Common::Arrays.variations(array).map {|element| element.inject(:+)}
    end
  end
end