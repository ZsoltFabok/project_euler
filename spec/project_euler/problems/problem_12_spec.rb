require 'spec_helper'

describe Problems::Problem12 do
  context "#calculate" do
    let(:divisors) {double}
    subject(:problem) {Problems::Problem12.new(divisors)}

    it "return 3 as the first number which has 2 divisors in the sequence of triangle numbers" do
      divisors.should_receive(:number_of_divisors).with(3).and_return(2)
      problem.calculate(2).should eq 3
    end

    it "return 6 as the first number which has 3 divisors in the sequence of triangle numbers" do
      divisors.should_receive(:number_of_divisors).with(2).and_return(2)
      divisors.should_receive(:number_of_divisors).with(3).and_return(2)
      problem.calculate(3).should eq 6
    end

    it "return 6 as the first number which has 4 divisors in the sequence of triangle numbers" do
      divisors.should_receive(:number_of_divisors).with(2).and_return(2)
      divisors.should_receive(:number_of_divisors).with(3).and_return(2)
      problem.calculate(4).should eq 6
    end

    it "returns 28 as the first number which has 6 divisors in the sequence of triangle numbers" do
      divisors.should_receive(:number_of_divisors).with(2).and_return(2)
      divisors.should_receive(:number_of_divisors).twice.with(3).and_return(2)
      divisors.should_receive(:number_of_divisors).with(4).and_return(3)
      divisors.should_receive(:number_of_divisors).with(5).and_return(2)
      divisors.should_receive(:number_of_divisors).with(7).and_return(2)
      problem.calculate(5).should eq 28
    end
  end

  context "#execute" do
    it "returns 76576500 as the first number which has 500 divisors in the sequence of triangle numbers", slow: true do
      Problems::Problem12.execute.should eq 76576500
    end
  end
end