module Problems
  # By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
  # we can see that the 6th prime is 13.
  #
  # What is the 10001st prime number?
  class Problem7
    def execute
      calculate(10001)
    end

    def calculate(number)
      prime_handler = Math::PrimeWithCache.new(Common::Cache.new("data/prime_numbers.txt"))
      if number > prime_handler.number_of_known_primes
        while (prime_handler.number_of_known_primes <= number-1) do
          candidate = prime_handler.next_unknown_prime
        end
      end
      return prime_handler.prime_at_position(number-1)
    end
  end
end