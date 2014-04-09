module Math
  class DivisorsCached < Divisors
    def self.create(cache)
      prime_factors = Math::PrimeFactorsCached.create(cache)
      arrays = Common::Arrays.new
      new(prime_factors, arrays)
    end
  end
end