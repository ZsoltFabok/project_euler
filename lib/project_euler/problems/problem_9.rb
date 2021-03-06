module Problems
  # A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  # a^2 + b^2 = c^2
  # For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
  #
  # There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  # Find the product abc.
  class Problem9
    def initialize(pythagorean_triples, arrays)
      @pythagorean_triples = pythagorean_triples
      @arrays = arrays
    end

    def self.execute
      new(Math::PythagoreanTriples.new, Common::Arrays.new).calculate(1000)
    end

    def calculate(number)
      x = number / 2 # number = a + b + c, a^2 + b^2 = c^2, therefore c is not larger than number / 2
      @pythagorean_triples.find_under(x).each do |triplet|
        if @arrays.sum(triplet) == number
          return @arrays.multiply(triplet).to_i
        end
      end
    end
  end
end