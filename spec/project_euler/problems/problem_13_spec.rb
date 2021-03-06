require 'spec_helper'

describe Problems::Problem13 do
  context "#calculate" do
    let(:arrays) {double}
    subject(:problem) {Problems::Problem13.new(arrays)}

    it "returns the first 10 digits of the summary of the provided numbers (in string)" do
      numbers = "20849603980134001723930671666823555245252804609722
                 53503534226472524250874054075591789781264330331690"
      expect(arrays).to receive(:sum)
        .with([20849603980134001723930671666823555245252804609722,
               53503534226472524250874054075591789781264330331690])
        .and_return(74353138206606525974804725742415345026517134941412)
      expect(problem.calculate(numbers)).to eq "7435313820"
    end
  end

  context "#execute" do
    it "returns the first ten digits of the sum of the provided one-hundred 50-digit numbers" do
      expect(Problems::Problem13.execute).to eq "5537376230"
    end
  end
end