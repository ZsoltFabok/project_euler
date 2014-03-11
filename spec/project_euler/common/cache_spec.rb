require 'spec_helper'

describe Common::Cache do
  before(:each) do
    @file_name = "file name"
    @cache = Common::Cache.new(@file_name)
    @file = double
  end

  context "#load" do
    it "loads the files from the given file" do
      File.should_receive(:open).with(@file_name, "r").and_yield(@file)
      @file.should_receive(:readlines).and_return(["2\n", "3\n"])
      @cache.load
    end
  end

  context "#save" do
    it "updates the cache with the new prime" do
      mock_cache_file_content([2])
      File.should_receive(:open).with(@file_name, "a+").and_yield(@file)
      @file.should_receive(:write).with("3\n")
      @cache.save(3)
    end
  end

  context "#has" do
    it "returns true if the cache has the given number" do
      mock_cache_file_content([3, 2])
      @cache.has?(3).should be_true
    end

    it "returns false if the cache does not have the given number" do
      mock_cache_file_content([3, 2])
      @cache.has?(5).should be_false
    end
  end

  context "#size" do
    it "returns the size of the cache" do
      mock_cache_file_content([3, 2])
      @cache.size.should eq 2
    end
  end

  context "#last" do
    it "returns the last entry from the cache" do
      mock_cache_file_content([3, 2])
      @cache.last.should eq 3
    end
  end

  context "#find" do
    it "returns the position of a number in the cache" do
      mock_cache_file_content([3, 2])
      @cache.find(3).should eq 1
    end

    it "returns nil if the number is not found in the cache" do
      mock_cache_file_content([3, 2])
      @cache.find(5).should be_nil
    end
  end

  context "#at" do
    it "returns the number at the given position" do
      mock_cache_file_content([3, 2])
      @cache.at(1).should eq 3
    end
  end

  def mock_cache_file_content(numbers)
    File.stub(:open).with(@file_name, "r").and_yield(@file)
    @file.stub(:readlines).and_return(numbers.map {|n| "#{n}\n"})
  end

  def mock_cache_write(number)
    File.stub(:open).with(@file_name, "a+").and_yield(@file)
    @file.stub(:write).with("#{number}\n")
  end
end