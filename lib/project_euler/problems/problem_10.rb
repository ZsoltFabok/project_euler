module Problems
  class Problem10
    def execute
      calculate(2000000)
    end

    def calculate(number)
      generator = Math::PrimeGeneratorWithCache.new(Common::Cache.new("data/prime_numbers.txt"))
      generator.primes(number).inject(:+)
    end
  end
end