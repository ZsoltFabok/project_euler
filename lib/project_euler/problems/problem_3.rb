module Problems
  # The prime factors of 13195 are 5, 7, 13 and 29.
  #
  # What is the largest prime factor of the number 600851475143 ?
  class Problem3
    def initialize(prime)
      @prime = prime
    end

    def self.execute
      prime_with_cache = Math::PrimeWithCache.create("data/prime_numbers.txt")
      new(prime_with_cache).calculate(600851475143)
    end

    def calculate(number)
      primes = @prime.factorisation(number)
      primes.last
    end
  end
end