module Problems
  # The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
  #
  # Find the sum of all the primes below two million.
  class Problem10
    def initialize(prime_generator)
      @prime_generator = prime_generator
    end

    def self.execute
      cache = Common::Cache.create
      cache = Math::PrimeGeneratorCached.create(cache)
      new(cache).calculate(2000000)
    end

    def calculate(number)
      @prime_generator.primes(number).inject(:+)
    end
  end
end