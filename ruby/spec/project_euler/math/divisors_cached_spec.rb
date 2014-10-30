require 'spec_helper'

describe Math::DivisorsCached do
  context "integration" do
  	let(:cach_file) {"data/test_prime_numbers.txt"}
    let(:cache) {Common::Cache.new(Common::DataFile.new(cach_file), Common::Arrays.new)}
    subject(:divisors) {Math::DivisorsCached.create(cache)}

    before(:each) do
    	delete(cach_file)
    end

    after(:each) do
    	delete(cach_file)
    end

    it "returns 4 for 6 using the cache" do
      write_array_to_file(cach_file, [2,3,5,7,9,11])
      expect(divisors.number_of_divisors(6)).to eq 4
    end

    it "fills up the cache with prime numbers" do
    	create_empty_file(cach_file)
    	divisors.number_of_divisors(28)
    	expect(read_array_from_file(cach_file)).to eq [2,3,5,7]
    end
  end
end