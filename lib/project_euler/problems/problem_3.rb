module Problems
  # The prime factors of 13195 are 5, 7, 13 and 29.
  #
  # What is the largest prime factor of the number 600851475143 ?
  class Problem3
    def execute
      calculate(600851475143)
    end

    def calculate(number)
      primes = Math::PrimeWithCache.new(Common::Cache.new("data/prime_numbers.txt")).factorisation(number)
      primes.last
    end
  end
end