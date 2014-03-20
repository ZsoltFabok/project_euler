require 'spec_helper'

describe Common::Arrays do
  context "#sum" do
    it "should return the sum of elements of a given array" do
      Common::Arrays.sum([1, 2, 3]).should eq 6
    end
  end

  context "#multiply" do
    it "should multiply elements of array" do
      Common::Arrays.multiply([2,3,5]).should eq 30
    end
  end

  context "#binary_search" do
    it "finds 5 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(5, [2, 3, 4, 5, 7]).should eq 3
    end

    it "finds 4 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(4, [2, 3, 4, 5, 7]).should eq 2
    end

    it "finds 2 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(2, [2, 3, 4, 5, 7]).should eq 0
    end

    it "finds 7 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(7, [2, 3, 4, 5, 7]).should eq 4
    end

    it "finds 3 in [2, 3, 4, 5]" do
      Common::Arrays.binary_search(3, [2, 3, 4, 5, 7]).should eq 1
    end

    it "doesn't find 8 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(8, [2, 3, 4, 5, 7]).should eq nil
    end

    it "doesn't find 1 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(1, [2, 3, 4, 5, 7]).should eq nil
    end

    it "doesn't find 6 in [2, 3, 4, 5, 7]" do
      Common::Arrays.binary_search(6, [2, 3, 4, 5, 7]).should eq nil
    end
  end
end