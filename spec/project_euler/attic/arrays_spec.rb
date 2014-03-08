require 'spec_helper'

describe Attic::Arrays do
  context "#multiply_elements" do
    it "should multiply elements of array" do
      Attic::Arrays.multiply_elements([2,3,5]).should eq 30
    end
  end

  context "#variations" do
    it "should return all variations for an array with 2 elements" do
      get_variations(["a", "b"]).should eq ["ab", "ba"]
    end

    it "should return all variations for an array with 3 elements" do
      get_variations(["a", "b", "c"]).should eq ["abc", "acb", "bac", "bca", "cab", "cba"]
    end

    it "should return all variations for an array with 4 elements" do
      get_variations(["a", "b", "c", "d"]).should eq [
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