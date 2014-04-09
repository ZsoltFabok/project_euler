require 'spec_helper'

describe Math::PrimeEnumerator do
  context "unit" do
    let(:checker) {double}
    subject(:enumerator) {Math::PrimeEnumerator.new(checker)}

    describe "#next" do
  		it "returns the next prime number" do
        checker.should_receive(:is_prime?).with(2).and_return true
  			checker.should_receive(:is_prime?).with(3).and_return true
  			checker.should_not_receive(:is_prime?).with(4)
  			checker.should_receive(:is_prime?).with(5).and_return true
  			enumerator.next.should eq 2
  			enumerator.next.should eq 3
  			enumerator.next.should eq 5
  		end
  	end
  end

	context "integration" do
    subject(:enumerator) {Math::PrimeEnumerator.create}

    it "returns the next prime number" do
      enumerator.next.should eq 2
      enumerator.next.should eq 3
      enumerator.next.should eq 5
    end
  end
end
