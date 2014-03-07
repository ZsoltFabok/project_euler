require 'spec_helper'

describe Math::PrimeWithCache do
  context "cache" do
    before(:each) do
      @file_name = "file name"
      @number = 6

      @prime = Math::PrimeWithCache.new(@file_name)
      @file = double
    end

    it "should use the prime cache" do
      File.should_receive(:open).with(@file_name, "r").and_yield(@file)
      @file.should_receive(:readlines).and_return(["2\n", "3\n"])

      @prime.factorisation(@number).should eq [2, 3]
    end

    it "should not use the cache and update it with the new prime" do
      File.stub(:open).with(@file_name, "r").and_yield(@file)
      @file.stub(:readlines).and_return(["2\n"])

      File.should_receive(:open).with(@file_name, "a+").and_yield(@file)
      @file.should_receive(:write).with("3\n")

      @prime.factorisation(@number).should eq [2, 3]
    end
  end
end