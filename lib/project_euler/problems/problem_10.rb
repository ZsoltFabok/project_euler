module Problems
  class Problem10
    def execute(number)
      generator = Math::PrimeGeneratorWithCache.new(Common::Cache.new("data/prime_numbers.txt"))
      generator.primes(number).inject(:+)
    end
  end
end