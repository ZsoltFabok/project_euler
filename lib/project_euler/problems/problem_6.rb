module Problems
  # The difference between the sum of the squares of the first ten natural numbers
  # and the square of the sum is 3025 − 385 = 2640.
  #
  # Find the difference between the sum of the squares of the first one hundred natural numbers
  # and the square of the sum.
  class Problem6
    def initialize(arrays)
      @arrays = arrays
    end

    def self.execute
      new(Common::Arrays.new).calculate(100)
    end

    def calculate(number)
      square_of_the_sum = @arrays.sum((1..number).to_a) ** 2
      sum_of_the_squares = @arrays.sum((1..number).to_a.map {|n| n**2})
      square_of_the_sum - sum_of_the_squares
    end
  end
end