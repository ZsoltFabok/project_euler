module Problems
  # Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
  # If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called
  # amicable numbers.
  #
  # For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
  # therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
  #
  # Evaluate the sum of all the amicable numbers under 10000.
  class Problem21
    def initialize(divisors, arrays)
      @divisors = divisors
      @arrays = arrays
    end

    def self.execute
      new(Math::DivisorsCached.create(Common::Cache.create), Common::Arrays.new).calculate(10000)
    end

    def calculate(number)
      numbers = {}
      (2..number).each do |candidate|
        divisors = @divisors.get(candidate)[0..-2]
        # skip primes
        if divisors.size > 1
          numbers[candidate] = @arrays.sum(divisors)
        end
      end

      sum_of_amicable_numbers = 0
      numbers.each do |key,value|
        if key != value && key == numbers[value]
          numbers.delete(key)
          sum_of_amicable_numbers += (key+value)
        end
      end
      sum_of_amicable_numbers
    end
  end
end