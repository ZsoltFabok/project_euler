require 'spec_helper'

describe Math::PrimeEnumeratorCached do
  context "unit" do
    let(:cache) {double}
    subject(:enumerator) {Math::PrimeEnumeratorCached.new(cache)}

    describe "#next" do
      it "saves the next prime in cache when it was not found there" do
        cache_enumerator = double
        cache.should_receive(:enumerator).and_return(cache_enumerator)
        cache_enumerator.should_receive(:next).and_return(nil)
        cache.should_receive(:last).twice.and_return 2
        cache.should_receive(:has?).with(3).and_return false
        cache.should_receive(:empty?).and_return false
        cache.should_receive(:save)

        enumerator.next
      end
    end
  end

  context "integration" do
    let(:cach_file) {"data/test_prime_numbers.txt"}
    let(:cache) {Common::Cache.new(cach_file, Common::Arrays.new)}
    subject(:enumerator) {Math::PrimeEnumeratorCached.create(cache)}

    before(:each) do
      delete(cach_file)
    end

    after(:each) do
      delete(cach_file)
    end

    it "returns primes from the cache" do
      write_array_to_file(cach_file, [2,3,5])
      enumerator.next.should eq 2
      enumerator.next.should eq 3
      enumerator.next.should eq 5
    end

    it "fills up the cache with prime numbers" do
      create_empty_file(cach_file)
      4.times {enumerator.next}
      read_array_from_file(cach_file).should eq [2,3,5,7]
    end
  end
end