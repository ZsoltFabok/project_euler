require 'spec_helper'

describe Common::Number do
	context "unit" do
		subject(:number) {Common::Number.new}

	  describe "#palindromic" do
	    it "should return true for 9009" do
	    	expect(number.is_palindromic?(9009)).to be true
	    end

	    it "should return false for 9008" do
	    	expect(number.is_palindromic?(9008)).to be false
	    end
	  end

	  describe "#in_letters" do
			it "returns the written words of numbers that are not a combination of others" do
	      expect(number.in_letters(1)).to eq "one"
	      expect(number.in_letters(2)).to eq "two"
	      expect(number.in_letters(3)).to eq "three"
	      expect(number.in_letters(4)).to eq "four"
	      expect(number.in_letters(5)).to eq "five"
	      expect(number.in_letters(6)).to eq "six"
	      expect(number.in_letters(7)).to eq "seven"
	      expect(number.in_letters(8)).to eq "eight"
	      expect(number.in_letters(9)).to eq "nine"
	      expect(number.in_letters(10)).to eq "ten"
	      expect( number.in_letters(11)).to eq "eleven"
	      expect(number.in_letters(12)).to eq "twelve"
	      expect(number.in_letters(13)).to eq "thirteen"
	      expect(number.in_letters(14)).to eq "fourteen"
	      expect(number.in_letters(15)).to eq "fifteen"
	      expect(number.in_letters(16)).to eq "sixteen"
	      expect(number.in_letters(17)).to eq "seventeen"
	      expect(number.in_letters(18)).to eq "eighteen"
	      expect(number.in_letters(19)).to eq "nineteen"
	      expect(number.in_letters(20)).to eq "twenty"
	      expect(number.in_letters(30)).to eq "thirty"
	    end

	    it "returns the written words of numbers that are written with a combination of two with -" do
	      expect(number.in_letters(21)).to eq "twenty-one"
	      expect(number.in_letters(67)).to eq "sixty-seven"
	    end

	    it "returns the written words of numbers like 100, 200 etc." do
	      expect(number.in_letters(100)).to eq "one hundred"
	      expect(number.in_letters(500)).to eq "five hundred"
	      expect(number.in_letters(1000)).to eq "one thousand"
	      expect(number.in_letters(3000)).to eq "three thousand"
	    end

	    it "returns the written words of numbers that needs an 'and'" do
	      expect(number.in_letters(101)).to eq "one hundred and one"
	      expect(number.in_letters(115)).to eq "one hundred and fifteen"
	      expect(number.in_letters(342)).to eq "three hundred and forty-two"
	      expect(number.in_letters(5701)).to eq "five thousand seven hundred and one"
	    end
	  end

	  describe "#digits" do
	  	it "returns [1] for 1" do
	  		expect(number.digits(1)).to eq [1]
	  	end

	  	it "returns [1,2] for 12" do
	  		expect(number.digits(12)).to eq [1,2]
	  	end
	  end
	end
end