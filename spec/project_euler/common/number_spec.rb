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
	      number.in_letters(1).should eq "one"
	      number.in_letters(2).should eq "two"
	      number.in_letters(3).should eq "three"
	      number.in_letters(4).should eq "four"
	      number.in_letters(5).should eq "five"
	      number.in_letters(6).should eq "six"
	      number.in_letters(7).should eq "seven"
	      number.in_letters(8).should eq "eight"
	      number.in_letters(9).should eq "nine"
	      number.in_letters(10).should eq "ten"
	      number.in_letters(11).should eq "eleven"
	      number.in_letters(12).should eq "twelve"
	      number.in_letters(13).should eq "thirteen"
	      number.in_letters(14).should eq "fourteen"
	      number.in_letters(15).should eq "fifteen"
	      number.in_letters(16).should eq "sixteen"
	      number.in_letters(17).should eq "seventeen"
	      number.in_letters(18).should eq "eighteen"
	      number.in_letters(19).should eq "nineteen"
	      number.in_letters(20).should eq "twenty"
	      number.in_letters(30).should eq "thirty"
	    end

	    it "returns the written words of numbers that are written with a combination of two with -" do
	      number.in_letters(21).should eq "twenty-one"
	      number.in_letters(67).should eq "sixty-seven"
	    end

	    it "returns the written words of numbers like 100, 200 etc." do
	      number.in_letters(100).should eq "one hundred"
	      number.in_letters(500).should eq "five hundred"
	      number.in_letters(1000).should eq "one thousand"
	      number.in_letters(3000).should eq "three thousand"
	    end

	    it "returns the written words of numbers that needs an 'and'" do
	      number.in_letters(101).should eq "one hundred and one"
	      number.in_letters(115).should eq "one hundred and fifteen"
	      number.in_letters(342).should eq "three hundred and forty-two"
	      number.in_letters(5701).should eq "five thousand seven hundred and one"
	    end
	  end

	  describe "#digits" do
	  	it "returns [1] for 1" do
	  		number.digits(1).should eq [1]
	  	end

	  	it "returns [1,2] for 12" do
	  		number.digits(12).should eq [1,2]
	  	end
	  end
	end
end