module Problems
  # By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
  # we can see that the 6th prime is 13.
  #
  # What is the 10001st prime number?
  class Problem7
    def initialize(prime_enumerator)
      @prime_enumerator = prime_enumerator
    end

    def self.execute
      cache = Common::Cache.create
      prime_enumerator = Math::PrimeEnumeratorCached.create(cache)
      new(prime_enumerator).calculate(10001)
    end

    def calculate(number)
      count = 0
      while (count < number-1) do
        @prime_enumerator.next
        count += 1
      end
      @prime_enumerator.next
    end
  end
end