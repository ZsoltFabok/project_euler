require 'spec_helper'

describe Math::PrimeFactorsCached do
  context "integration" do
    let(:cach_file) {"data/test_prime_numbers.txt"}
    let(:cache) {Common::Cache.new(cach_file, Common::Arrays.new)}
    subject(:factors) {Math::PrimeFactorsCached.create(cache)}

    before(:each) do
      delete(cach_file)
    end

    after(:each) do
      delete(cach_file)
    end

    it "returns [11, 13] for 143" do
      write_array_to_file(cach_file, [2,3,5,7,11,13])
      factors.factors(143).should eq [11, 13]
    end

     it "fills up the cache with prime numbers" do
      create_empty_file(cach_file)
      factors.factors(143)
      read_array_from_file(cach_file).should eq [2,3,5,7,11,13]
    end
  end
end