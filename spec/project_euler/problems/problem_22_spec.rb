require 'spec_helper'

describe Problems::Problem22 do
  context "#calculate" do
    let(:data_file) {double}
    let(:letter) {double}
    let(:word) {double}
    subject(:problem) {Problems::Problem22.new(data_file, word, letter)}

    it "returns 53 (COLIN: 53, position 1 -> 53*1) for COLIN" do
      expect(data_file).to receive(:read).and_return(["\"COLIN\""])
      expect(word).to receive(:to_letters).with("COLIN").and_return(["C", "O", "L", "I", "N"])
      expect(letter).to receive(:to_number).with("C").and_return(3)
      expect(letter).to receive(:to_number).with("O").and_return(15)
      expect(letter).to receive(:to_number).with("L").and_return(12)
      expect(letter).to receive(:to_number).with("I").and_return(9)
      expect(letter).to receive(:to_number).with("N").and_return(14)

      expect(problem.calculate).to eq 53
    end

    it "returns 92 (JOE: 30, TOM: 31, 1x30 + 2x31 = 92) for [TOM, JOE]" do
      expect(data_file).to receive(:read).and_return(["\"TOM\",\"JOE\""])

      expect(word).to receive(:to_letters).with("JOE").and_return(["J", "O", "E"]).ordered
      expect(word).to receive(:to_letters).with("TOM").and_return(["T", "O", "M"]).ordered

      expect(letter).to receive(:to_number).with("T").and_return(3)
      expect(letter).to receive(:to_number).with("O").and_return(15)
      expect(letter).to receive(:to_number).with("M").and_return(13)

      expect(letter).to receive(:to_number).with("J").and_return(10)
      expect(letter).to receive(:to_number).with("O").and_return(15)
      expect(letter).to receive(:to_number).with("E").and_return(5)

      expect(problem.calculate).to eq 92
    end
  end

  context "#execute" do
    it "returns 871198282 as the total scores in the data file" do
      expect(Problems::Problem22.execute).to eq 871198282
    end
  end
end