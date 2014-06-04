require 'spec_helper'

describe Common::Cache do
  context "unit" do
    let(:file_name) {"file name"}
    let(:file) {double}
    let(:arrays) {double}
    subject(:cache) {Common::Cache.new(file_name, arrays)}

    describe "#load" do
      it "loads the files from the given file" do
        expect(File).to receive(:open).with(file_name, "r").and_yield(file)
        expect(file).to receive(:readlines).and_return(["2\n", "3\n"])
        cache.load
      end
    end

    describe "#save" do
      it "updates the cache with the new prime" do
        mock_cache_file_content([2])
        expect(File).to receive(:open).with(file_name, "a+").and_yield(file)
        expect(file).to receive(:write).with("3\n")
        cache.save(3)
      end

      it "updates the cache with primes" do
        mock_cache_file_content([2])
        expect(File).to receive(:open).with(file_name, "a+").and_yield(file)
        expect(file).to receive(:write).with("3\n")
        expect(file).to receive(:write).with("5\n")
        expect(file).to receive(:write).with("7\n")
        cache.save([3, 5, 7])
      end
    end

    describe "#empty?" do
      it "returns true if the cache is empty" do
        mock_cache_file_content([])
        expect(cache.empty?).to be true
      end

      it "returns false if the cache is not empty" do
        mock_cache_file_content([2,3])
        expect(cache.empty?).to be false
      end
    end

    describe "#has?" do
      it "returns true if the cache has the given number" do
        mock_cache_file_content([3, 2])
        expect(arrays).to receive(:binary_search).with(3, [2, 3]).and_return(1)
        expect(cache.has?(3)).to be true
      end

      it "returns false if the cache does not have the given number" do
        mock_cache_file_content([3, 2])
        expect(arrays).to receive(:binary_search).with(5, [2, 3]).and_return(nil)
        expect(cache.has?(5)).to be false
      end
    end

    describe "#last" do
      it "returns the last entry from the cache" do
        mock_cache_file_content([3, 2])
        expect(cache.last).to eq 3
      end
    end

    describe "#sub" do
      it "returns the numbers from the cache using the given range" do
        mock_cache_file_content([2, 3, 5, 7])
        expect(cache.sub(1..3)).to eq [3,5,7]
      end
    end

    describe "#find" do
      it "returns the position of a number in the cache" do
        mock_cache_file_content([3, 2])
        expect(arrays).to receive(:binary_search).with(3, [2, 3]).and_return 1
        expect(cache.find(3)).to eq 1
      end

      it "returns nil if the number is not found in the cache" do
        mock_cache_file_content([3, 2])
        expect(arrays).to receive(:binary_search).with(5, [2, 3]).and_return nil
        expect(cache.find(5)).to be nil
      end
    end

    describe "#enumerator" do
      it "returns the next element" do
        mock_cache_file_content([2, 3, 5])
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
        expect(enumerator.next).to eq 3
      end

      it "new enumerator new enumeration" do
        mock_cache_file_content([2, 3, 5])
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
        enumerator = cache.enumerator
        expect(enumerator.next).to eq 2
      end

      it "returns nil after reaching the end of the collection" do
        mock_cache_file_content([2, 3])
        enumerator = cache.enumerator
        enumerator.next
        enumerator.next
        expect(enumerator.next).to be_nil
      end
    end
    def mock_cache_file_content(numbers)
      expect(File).to receive(:open).with(file_name, "r").and_yield(file)
      expect(file).to receive(:readlines).and_return(numbers.map {|n| "#{n}\n"})
    end
  end

  context "integration" do
    it "creates a new instance" do
      expect(Common::Cache.create.class).to eq Common::Cache
    end
  end
end