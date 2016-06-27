require 'spec_helper'

describe Common::Letter do
  context "unit" do
    subject(:letter) {Common::Letter.new}

    describe "#to_number" do
      it "should return 1 for A" do
        expect(letter.to_number('A')).to eq 1
      end

      it "should return 20 for T" do
        expect(letter.to_number('T')).to eq 20
      end
    end
  end
end