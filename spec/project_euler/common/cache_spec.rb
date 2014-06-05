require 'spec_helper'

describe Common::Cache do
  context "unit" do
    let(:data_file) {double}
    let(:arrays) {double}
    subject(:cache) {Common::Cache.new(data_file, arrays)}

    describe "#load" do
      it "loads the files from the given file" do
        expect(data_file).to receive(:read).and_return(["2\n", "3\n"])
        cache.load
      end
    end

    describe "#save" do
      it "updates the cache with the new prime" do
        expect(data_file).to receive(:read).and_return([])
        expect(data_file).to receive(:save).with(3)
        cache.save(3)
      end

      it "updates the cache with primes" do
        expect(data_file).to receive(:read).and_return([])
        expect(data_file).to receive(:save).with([3, 5, 7])
        cache.save([3, 5, 7])
      end
    end

    describe "#empty?" do
      it "returns true if the cache is empty" do
        expect(data_file).to receive(:read).and_return([])
        expect(cache.empty?).to be true
      end

      it "returns false if the cache is not empty" do
        expect(data_file).to receive(:read).and_return([2,3])
        expect(cache.empty?).to be false
      end
    end

    describe "#has?" do
      it "returns true if the cache has the given number" do
        expect(data_file).to receive(:read).and_return([3, 2])
        expect(arrays).to receive(:binary_search).with(3, [2, 3]).and_return(1)
        expect(cache.has?(3)).to be true
      end

      it "returns false if the cache does not have the given number" do
        expect(data_file).to receive(:read).and_return([3, 2])
        expect(arrays).to receive(:binary_search).with(5, [2, 3]).and_return(nil)
        expect(cache.has?(5)).to be false
      end
    end

    describe "#last" do
      it "returns the last entry from the cache" do
        expect(data_file).to receive(:read).and_return([3, 2])
        expect(cache.last).to eq 3
      end
    end

    describe "#sub" do
      it "returns the numbers from the cache using the given range" do
        expect(data_file).to receive(:read).and_return([2, 3, 5, 7])
        expect(cache.sub(1..3)).to eq [3,5,7]
      end
    end

    describe "#find" do
      it "returns the position of a number in the cache" do
        expect(data_file).to receive(:read).and_return([3, 2])
        expect(arrays).to receive(:binary_search).with(3, [2, 3]).and_return 1
        expect(cache.find(3)).to eq 1
      end

      it "returns nil if the number is not found in the cache" do
        expect(data_file).to receive(:read).and_return([3, 2])
        expect(arrays).to receive(:binary_search).with(5, [2, 3]).and_return nil
        expect(cache.find(5)).to be nil
      end
    end

    describe "#enumerator" do
      it "returns the next element" do
        expect(data_file).to receive(:read).and_return([2, 3, 5])
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
        expect(enumerator.next).to eq 3
      end

      it "new enumerator new enumeration" do
        expect(data_file).to receive(:read).and_return([2, 3, 5])
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
      end

      it "returns nil after reaching the end of the collection" do
        expect(data_file).to receive(:read).and_return([2, 3])
        enumerator = cache.enumerator
        enumerator.next
        enumerator.next
        expect(enumerator.next).to be_nil
      end
    end
  end

  context "integration" do
    it "creates a new instance" do
      expect(Common::Cache.create.class).to eq Common::Cache
    end
  end
end