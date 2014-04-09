require 'spec_helper'

describe Math::PrimeGeneratorCached do
  context "unit" do
    let(:cache) {double}
    subject(:generator) {Math::PrimeGeneratorCached.new(cache)}

    describe "#primes" do
      it "uses the prime cache to return a subset of primes" do
        cache.should_receive(:empty?).and_return(false)
        cache.should_receive(:last).and_return(11)
        cache.should_receive(:find).with(7).and_return 3
        cache.should_receive(:sub).with(0..3).and_return [2, 3, 5, 7]
        generator.primes(7).should eq [2, 3, 5, 7]
      end

      it "uses the prime cache to return all the primes" do
        cache.should_receive(:empty?).and_return(false)
        cache.should_receive(:last).and_return(7)
        cache.should_receive(:find).with(7).and_return 3
        cache.should_receive(:sub).with(0..3).and_return [2, 3, 5, 7]
        generator.primes(7).should eq [2, 3, 5, 7]
      end

      it "stores the new primes in the cache" do
        cache.should_receive(:empty?).twice.and_return(false)
        cache.should_receive(:last).twice.and_return(7)
        cache.should_receive(:save).with([11])
        generator.primes(11).should eq [2, 3, 5, 7, 11]
      end

      it "uses the prime cache to return all the primes" do
        cache.should_receive(:empty?).twice.and_return(true)
        cache.should_not_receive(:last)
        cache.should_not_receive(:sub)
        cache.should_receive(:save).with([2, 3, 5, 7])
        generator.primes(7).should eq [2, 3, 5, 7]
      end
    end
  end

  context "integration" do
    let(:cache) {Common::Cache.create}
    subject(:generator) {Math::PrimeGeneratorCached.create(cache)}

    it "returns the primes below 7" do
      mock_cache_file_content([2,3,5,7])
      generator.primes(7).should eq [2,3,5,7]
    end
  end
end