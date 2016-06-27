require 'spec_helper'

describe Problems::Problem9 do
  context "#calculate" do
    let(:pythagorean_triples) {double}
    let(:arrays) {double}
    subject(:problem) {Problems::Problem9.new(pythagorean_triples, arrays)}

    it "returns 60 (3*4*5) for 12 (3+4+5)" do
      expect(pythagorean_triples).to receive(:find_under).with(6).and_return([[3, 4, 5]])
      expect(arrays).to receive(:sum).with([3, 4, 5]).and_return(12)
      expect(arrays).to receive(:multiply).with([3, 4, 5]).and_return(60)
      expect(problem.calculate(12)).to eq 60
    end
  end

  context "#execute" do
    it "returns 31875000 (200*375*425) for 1000 (200+375+425)" do
      expect(Problems::Problem9.execute).to eq 31875000
    end
  end
end