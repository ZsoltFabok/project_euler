module Problems
  # The prime factors of 13195 are 5, 7, 13 and 29.
  #
  # What is the largest prime factor of the number 600851475143 ?
  class Problem3
    def initialize(prime_factors)
      @prime_factors = prime_factors
    end

    def self.execute
      cache = Common::Cache.create
      prime_factors = Math::PrimeFactorsCached.create(cache)
      new(prime_factors).calculate(600851475143)
    end

    def calculate(number)
      factors = @prime_factors.factors(number)
      factors.last
    end
  end
end