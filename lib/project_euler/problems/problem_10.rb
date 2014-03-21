module Problems
  class Problem10
    def initialize(prime_generator)
      @prime_generator = prime_generator
    end

    def self.execute
      cache = Math::PrimeGeneratorWithCache.create("data/prime_numbers.txt")
      new(cache).calculate(2000000)
    end

    def calculate(number)
      @prime_generator.primes(number).inject(:+)
    end
  end
end