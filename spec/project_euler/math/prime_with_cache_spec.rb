require 'spec_helper'

describe Math::PrimeWithCache do
  context "cache" do
    before(:each) do
      @file_name = "file name"
      @cache = double
      @prime = Math::PrimeWithCache.new(@cache)
    end

    describe "#factorisation" do
      it "uses the prime cache" do
        @cache.should_receive(:has?).with(3).and_return true
        @prime.factorisation(6).should eq [2, 3]
      end

      it "updates the cache with the a prime found during factorisation" do
        @cache.should_receive(:last).and_return 2
        @cache.should_receive(:has?).twice.with(3).and_return false
        @cache.should_receive(:save).with(3)

        @prime.factorisation(6).should eq [2, 3]
      end
    end

    describe "#number_of_known_primes" do
      it "returns the number of cached primes" do
        @cache.should_receive(:size).and_return 2
        @prime.number_of_known_primes.should eq 2
      end
    end

    describe "#number_of_known_primes" do
      it "looks for the first [un]known prime" do
        @cache.should_receive(:last).and_return(nil)
        @cache.should_receive(:save).with(2)
        @prime.next_unknown_prime.should eq 2
      end

      it "looks for the next unknown prime" do
        @cache.should_receive(:last).exactly(4).times.and_return(3)
        @cache.should_receive(:has?).exactly(2).times.with(4).and_return false
        @cache.should_receive(:has?).exactly(2).times.with(5).and_return false
        @cache.should_receive(:save).with(5)

        @prime.next_unknown_prime.should eq 5
      end

      it "looks for the next unknown prime twice if necessary" do
        @cache.should_receive(:last).exactly(4).times.and_return(3)
        @cache.should_receive(:has?).exactly(2).times.with(4).and_return false
        @cache.should_receive(:has?).exactly(2).times.with(5).and_return false
        @cache.should_receive(:save).with(5)
        @prime.next_unknown_prime

        @cache.should_receive(:last).exactly(3).times.and_return(5)
        @cache.should_receive(:has?).exactly(2).times.with(6).and_return false
        @cache.should_receive(:has?).exactly(2).times.with(7).and_return(false,true)
        @cache.should_receive(:save).with(7)
        @prime.next_unknown_prime.should eq 7
      end
    end

    describe "#position_in_cache" do
      it "returns the position of a prime in the cache" do
        @cache.should_receive(:find).with(3).and_return(1)
        @prime.position_in_cache(3).should eq 1
      end

      it "returns nil if the prime is not found in the cache" do
        @cache.should_receive(:find).with(5).and_return(nil)
        @prime.position_in_cache(5).should be_nil
      end
    end

    describe "#prime_at_position" do
      it "returns the prime at the given position" do
        @cache.should_receive(:at).with(1).and_return(3)
        @prime.prime_at_position(1).should eq 3
      end
    end
  end

  context "factories (#create)" do
    it "creates a new instance with file cache" do
      Math::PrimeWithCache.create(@file_name).class.should eq Math::PrimeWithCache
    end
  end
end