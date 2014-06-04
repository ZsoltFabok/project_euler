require 'spec_helper'

describe Math::PrimeCheckerCached do
  context "unit" do
    let(:cache) {double}
    subject(:checker) {Math::PrimeCheckerCached.new(cache)}

    describe "#is_prime?" do
      it "returns true for 3 when 3 is stored in the cache" do
        cache.should_receive(:has?).with(3).and_return(true)
        expect(checker.is_prime?(3)).to be true
      end

      it "returns false for 4 when the cache is empty" do
        cache.should_receive(:has?).with(4).and_return(false)
        cache.should_receive(:empty?).and_return true
        expect(checker.is_prime?(4)).to be false
      end

      it "returns false for 9 when the highest number in cache is 11" do
        cache.should_receive(:has?).with(9).and_return(false)
        cache.should_receive(:empty?).and_return false
        cache.should_receive(:last).and_return(11)
        expect(checker.is_prime?(9)).to be false
      end

      it "returns false for 9 but the highest number in cache is 7" do
        cache.should_receive(:has?).with(9).and_return(false)
        cache.should_receive(:empty?).and_return false
        cache.should_receive(:last).and_return(7)
        expect(checker.is_prime?(9)).to be false
      end
    end
  end

  context "integration" do
    let(:cache) {Common::Cache.create}
    subject(:checker) {Math::PrimeCheckerCached.create(cache)}

    it "returns false for 341 (pseudoprime)" do
      mock_cache_file_content([2,3,5,7,11,13])
      expect(checker.is_prime?(341)).to be false
    end
  end
end
