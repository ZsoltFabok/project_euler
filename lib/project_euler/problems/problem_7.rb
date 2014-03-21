module Problems
  # By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
  # we can see that the 6th prime is 13.
  #
  # What is the 10001st prime number?
  class Problem7
    def initialize(prime)
      @prime = prime
    end

    def self.execute
      prime_with_cache = Math::PrimeWithCache.create("data/prime_numbers.txt")
      new(prime_with_cache).calculate(10001)
    end

    def calculate(number)
      if number > @prime.number_of_known_primes
        while (@prime.number_of_known_primes <= number-1) do
          candidate = @prime.next_unknown_prime
        end
      end
      return @prime.prime_at_position(number-1)
    end
  end
end