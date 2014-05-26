module Problems
  # n! means n × (n − 1) × ... × 3 × 2 × 1
  #
  # For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  # and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
  #
  # Find the sum of the digits in the number 100!
  class Problem20
    def initialize(arrays, factorial)
      @arrays = arrays
      @factorial = factorial
    end

    def self.execute
      new(Common::Arrays.new, Math::Factorial).calculate(100)
    end

    def calculate(number)
      @arrays.sum(@factorial.get(number).to_s.split('').map{|n| n.to_i})
    end
  end
end