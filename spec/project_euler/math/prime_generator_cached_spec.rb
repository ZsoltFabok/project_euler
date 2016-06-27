require 'spec_helper'

describe Math::PrimeGeneratorCached do
  context "unit" do
    let(:cache) {double}
    subject(:generator) {Math::PrimeGeneratorCached.new(cache)}

    describe "#primes" do
      it "uses the prime cache to return a subset of primes" do
        expect(cache).to receive(:empty?).and_return(false)
        expect(cache).to receive(:last).and_return(11)
        expect(cache).to receive(:find).with(7).and_return 3
        expect(cache).to receive(:sub).with(0..3).and_return [2, 3, 5, 7]
        expect(generator.primes(7)).to eq [2, 3, 5, 7]
      end

      it "uses the prime cache to return all the primes" do
        expect(cache).to receive(:empty?).and_return(false)
        expect(cache).to receive(:last).and_return(7)
        expect(cache).to receive(:find).with(7).and_return 3
        expect(cache).to receive(:sub).with(0..3).and_return [2, 3, 5, 7]
        expect(generator.primes(7)).to eq [2, 3, 5, 7]
      end

      it "stores the new primes in the cache" do
        expect(cache).to receive(:empty?).twice.and_return(false)
        expect(cache).to receive(:last).twice.and_return(7)
        expect(cache).to receive(:save).with([11])
        expect(generator.primes(11)).to eq [2, 3, 5, 7, 11]
      end

      it "uses the prime cache to return all the primes" do
        expect(cache).to receive(:empty?).twice.and_return(true)
        expect(cache).not_to receive(:last)
        expect(cache).not_to receive(:sub)
        expect(cache).to receive(:save).with([2, 3, 5, 7])
        expect(generator.primes(7)).to eq [2, 3, 5, 7]
      end
    end
  end

  context "integration" do
    let(:cache) {Common::Cache.create}
    subject(:generator) {Math::PrimeGeneratorCached.create(cache)}

    it "returns the primes below 7" do
      mock_cache_file_content([2,3,5,7])
      expect(generator.primes(7)).to eq [2,3,5,7]
    end
  end
end