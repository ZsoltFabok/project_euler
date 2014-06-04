require 'spec_helper'

describe Math::PrimeEnumerator do
  context "unit" do
    let(:checker) {double}
    subject(:enumerator) {Math::PrimeEnumerator.new(checker)}

    describe "#next" do
  		it "returns the next prime number" do
        expect(checker).to receive(:is_prime?).with(2).and_return true
  			expect(checker).to receive(:is_prime?).with(3).and_return true
  			expect(checker).not_to receive(:is_prime?).with(4)
  			expect(checker).to receive(:is_prime?).with(5).and_return true
  			expect(enumerator.next).to eq 2
  			expect(enumerator.next).to eq 3
  			expect(enumerator.next).to eq 5
  		end
  	end
  end

	context "integration" do
    subject(:enumerator) {Math::PrimeEnumerator.create}

    it "returns the next prime number" do
      expect(enumerator.next).to eq 2
      expect(enumerator.next).to eq 3
      expect(enumerator.next).to eq 5
    end
  end
end
