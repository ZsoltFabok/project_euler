require 'spec_helper'

describe Math::PythagoreanTriples do
  context "#factorisation" do
    subject(:pythagorean_triples) {Math::PythagoreanTriples.new}

    it "finds all the pythagorean triples when c <= 100" do
      triples = [[3, 4, 5], [5, 12, 13], [8, 15, 17], [7, 24, 25], [20, 21, 29], [12, 35, 37],
                 [9, 40, 41], [27, 36, 45], [28, 45, 53], [11, 60, 61], [16, 63, 65], [33, 56, 65],
                 [48, 55, 73], [36, 77, 85], [13, 84, 85], [39, 80, 89], [65, 72, 97]]
      pythagorean_triples.find_under(100).should eq triples
    end

    it "finds all the primitive pythagorean triples when c <= 100" do
      triples = [[3, 4, 5], [5, 12, 13], [ 8, 15, 17], [7, 24, 25], [20, 21, 29], [12, 35, 37],
                 [9, 40, 41], [28, 45, 53], [11, 60, 61], [16, 63, 65], [33, 56, 65], [48, 55, 73],
                [36, 77, 85], [13, 84, 85], [39, 80, 89], [65, 72, 97]]
      pythagorean_triples.find_primitives_under(100).should eq triples
    end
  end
end