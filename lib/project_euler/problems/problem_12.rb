require 'benchmark'

module Problems
  # The sequence of triangle numbers is generated by adding the natural numbers.
  # So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
  #
  # 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
  #
  # Let us list the factors of the first seven triangle numbers:
  #
  #  1: 1
  #  3: 1,3
  #  6: 1,2,3,6
  # 10: 1,2,5,10
  # 15: 1,3,5,15
  # 21: 1,3,7,21
  # 28: 1,2,4,7,14,28
  # We can see that 28 is the first triangle number to have over five divisors.
  #
  # What is the value of the first triangle number to have over five hundred divisors?
  class Problem12
    def initialize(divisors)
      @divisors = divisors
    end

    def self.execute
      cache = Common::Cache.create
      divisors = Math::DivisorsCached.create(cache)
      new(divisors).calculate(500)
    end

    # A triangle number can be written as (n*(n+1))/2 and we are looking for the divisors
    # of this number. It is cheaper to look for the divisors of a product elements than the
    # product itself (divisors of 12 = divisors of 3 * divisors of 4).
    #
    # The trick is the /2 because that changes the divisors calculation above. But luckily,
    # either n or n+1 is even so before getting the divisors a /2 can be applied on one of them
    # and finally we get the divisors of (n*(n+1))/2
    def calculate(number)
      n = 1
      num_of_divisors_n = 1
      num_of_divisors_n_1 = 1
      while (num_of_divisors_n*num_of_divisors_n_1 < number) do
        n+=1
        num_of_divisors_n = num_of_divisors_n_1
       num_of_divisors_n_1 = number_of_divisors_without_one_2_factor(n+1)
      end
      return (n * (n + 1)) / 2
    end

    private
    def number_of_divisors_without_one_2_factor(number)
      if number.even?
        number /= 2
      end
      @divisors.number_of_divisors(number)
    end
  end
end