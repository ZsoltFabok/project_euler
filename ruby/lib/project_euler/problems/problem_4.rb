module Problems
  # A palindromic number reads the same both ways.
  # The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  #
  # Find the largest palindrome made from the product of two 3-digit numbers.
  class Problem4
    def initialize(number)
      @number = number
    end

    def self.execute
      new(Common::Number.new).calculate(3)
    end

    def calculate(digits)
      number = (10 ** digits - 1)
      end_ = 10 ** (digits - 1)
      best_candidate = -1
      (end_..number).reverse_each do |first|
        (end_..number).reverse_each do |second|
          candidate = first * second
          if @number.is_palindromic?(candidate) && candidate > best_candidate
            best_candidate = candidate
          end
        end
      end
      best_candidate
    end
  end
end