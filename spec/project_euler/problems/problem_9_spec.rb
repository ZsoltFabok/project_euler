require 'spec_helper'

describe Problems::Problem9 do
  context "#calculate" do
    let(:pythagorean_triples) {double}
    let(:arrays) {double}
    subject(:problem) {Problems::Problem9.new(pythagorean_triples, arrays)}

    it "returns 60 (3*4*5) for 12 (3+4+5)" do
      pythagorean_triples.should_receive(:find_under).with(6).and_return([[3, 4, 5]])
      arrays.should_receive(:sum).with([3, 4, 5]).and_return(12)
      arrays.should_receive(:multiply).with([3, 4, 5]).and_return(60)
      problem.calculate(12).should eq 60
    end
  end

  context "#execute" do
    it "returns 31875000 (200*375*425) for 1000 (200+375+425)" do
      Problems::Problem9.execute.should eq 31875000
    end
  end
end