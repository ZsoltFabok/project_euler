require 'spec_helper'

describe Common::Word do
  context "unit" do
    subject(:word) {Common::Word.new}

    describe "#to_letters" do
      it "should return [A] for A" do
        expect(word.to_letters('A')).to eq ["A"]
      end

      it "should return [C, O, L, I, N] for COLIN" do
        expect(word.to_letters("COLIN")).to eq ["C", "O", "L", "I", "N"]
      end
    end
  end
end