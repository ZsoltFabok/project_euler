require 'spec_helper'

describe Common::DataFile do
  context "unit" do
    let(:file_name) {"file name"}
    let(:file) {double}
    let(:file_content) {double}
    subject(:data_file) {Common::DataFile.new(file_name)}

    describe "#read" do
      it "returns the content of the file in an array" do
        expect(File).to receive(:open).with(file_name, "r").and_yield(file_content)
        expect(file_content).to receive(:readlines).and_return(["3", "7", "4"])
        expect(data_file.read).to eq ["3", "7", "4"]
      end
    end

    describe "#save" do
      it "saves a number in the file" do
        expect(File).to receive(:open).with(file_name, "a+").and_yield(file)
        expect(file).to receive(:write).with("3\n")
        data_file.save(3)
      end

      it "saves numbers in the file" do
        expect(File).to receive(:open).with(file_name, "a+").and_yield(file)
        expect(file).to receive(:write).with("3\n")
        expect(file).to receive(:write).with("5\n")
        expect(file).to receive(:write).with("7\n")
        data_file.save([3, 5, 7])
      end
    end
  end

  context "integration" do
    let(:file_name) {"file name"}

    it "loads the prime numbers" do
      expect(Common::DataFile.new("data/prime_numbers.txt").read.size).to be > 0
    end
  end
end