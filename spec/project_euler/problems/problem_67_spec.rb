require 'spec_helper'

describe Problems::Problem67 do
  let(:problem18) {double}
  let(:data_file) {double}
  subject(:problem) {Problems::Problem67.new(problem18, data_file)}

  context "#calculate" do
    let(:file_content) {double}

    it "loads the triangle from a file and uses problem18 for calculation" do
      expect(data_file).to receive(:read).and_return(["3","7 4"])
      expect(problem18).to receive(:calculate).with("3 7 4").and_return(10)
      expect(problem.calculate).to eq 10
    end
  end

  context "#execute" do
    it "the maximum total from top to bottom of the provided triangle" do
      expect(Problems::Problem67.execute).to eq 7273
    end
  end
end