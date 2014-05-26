require 'spec_helper'

describe Problems::Problem19 do
  subject(:problem) {Problems::Problem19.new}

  context "#calculate" do
    it "returns 2 for the year 1900 (April and July)" do
      problem.calculate("1900-01-01", "1900-12-31").should eq 2
    end

    it "returns 2 for the year 1901 (September and December)" do
      problem.calculate("1901-01-01", "1901-12-31").should eq 2
    end

    it "returns 3 between 1901 and 1902 (September, December in 1901, June in 1902)" do
      problem.calculate("1901-01-01", "1902-12-31").should eq 3
    end

    it "returns 4 between 1903 and 1904 (1904 is a leap year - 3 in 1903 and 1 in 1904)" do
      problem.calculate("1903-01-01", "1904-12-31").should eq 4
    end
  end

  context "#execute" do
    it "171 Sundays fell on the first of the month during the twentieth century" do
      Problems::Problem19.execute.should eq 171
    end
  end
end