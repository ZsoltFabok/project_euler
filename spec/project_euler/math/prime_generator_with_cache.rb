require 'spec_helper'

describe Math::PrimeGeneratorWithCache do
    before(:each) do
      @file_name = "file name"
      @cache = double
      @prime = Math::PrimeGeneratorWithCache.new(@cache)
    end

    context "#primes" do
      it "uses the prime cache" do
        @cache.should_receive(:last).and_return(11)
        @cache.should_receive(:get_until).with(7).and_return [2, 3, 5, 7]
        @prime.primes(7).should eq [2, 3, 5, 7]
      end

      it "stores the new primes in the cache" do
        @cache.should_receive(:last).and_return(7)
        @prime.should_receive(:primes).with(11)
        @cache.should_receive(:save).with([11])
        @prime.primes(11).should eq [2, 3, 5, 7, 11]
      end
    end

    context "factories (#create)" do
      it "creates a new instance with file cache" do
        Math::PrimeGeneratorWithCache.create(@file_name).class.should eq Math::PrimeGeneratorWithCache
      end
    end
end