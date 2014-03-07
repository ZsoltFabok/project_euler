require 'spec_helper'

describe Math::Prime do
  context "#factorisation" do
    subject(:prime) {Math::Prime.new}

    it "should return [2] for 2" do
      prime.factorisation(2).should eq [2]
    end

    it "should return [2, 3, 11, 11, 13] for 9438" do
      prime.factorisation(9438).should eq [2, 3, 11, 11, 13]
    end

    it "should return [5, 7, 13, 29] for 13195" do
      prime.factorisation(13195).should eq [5, 7, 13, 29]
    end
  end
end