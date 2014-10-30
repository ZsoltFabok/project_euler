require 'spec_helper'

describe Math::PrimeEnumeratorCached do
  context "unit" do
    let(:cache) {double}
    subject(:enumerator) {Math::PrimeEnumeratorCached.new(cache)}

    describe "#next" do
      it "saves the next prime in cache when it was not found there" do
        cache_enumerator = double
        expect(cache).to receive(:enumerator).and_return(cache_enumerator)
        expect(cache_enumerator).to receive(:next).and_return(nil)
        expect(cache).to receive(:last).twice.and_return 2
        expect(cache).to receive(:has?).with(3).and_return false
        expect(cache).to receive(:empty?).and_return false
        expect(cache).to receive(:save)

        enumerator.next
      end
    end
  end

  context "integration" do
    let(:cach_file) {"data/test_prime_numbers.txt"}
    let(:cache) {Common::Cache.new(Common::DataFile.new(cach_file), Common::Arrays.new)}
    subject(:enumerator) {Math::PrimeEnumeratorCached.create(cache)}

    before(:each) do
      delete(cach_file)
    end

    after(:each) do
      delete(cach_file)
    end

    it "returns primes from the cache" do
      write_array_to_file(cach_file, [2,3,5])
      expect(enumerator.next).to eq 2
      expect(enumerator.next).to eq 3
      expect(enumerator.next).to eq 5
    end

    it "fills up the cache with prime numbers" do
      create_empty_file(cach_file)
      4.times {enumerator.next}
      expect(read_array_from_file(cach_file)).to eq [2,3,5,7]
    end
  end
end