require 'spec_helper'

describe Problems::Problem67 do
  let(:problem18) {double}
  subject(:problem) {Problems::Problem67.new(problem18)}

  context "#calculate" do
    let(:file_content) {double}

    it "loads the triangle from a file and uses problem18 for calculation" do
      File.should_receive(:open).with("data/problem_67_input.txt", "r").and_yield(file_content)
      file_content.should_receive(:readlines).and_return(["3","7 4"])
      problem18.should_receive(:calculate).with("3 7 4").and_return(10)
      problem.calculate.should eq 10
    end
  end

  context "#execute" do
    it "the maximum total from top to bottom of the provided triangle" do
      Problems::Problem67.execute.should eq 7273
    end
  end
end