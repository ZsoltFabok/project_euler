module Math
  class PrimeGeneratorWithCache < PrimeGenerator
    def initialize(cache)
      @cache = cache
    end

    def primes(limit)
      if @cache.last <= limit
        return @cache.get_until(limit)
      else
        primes = super(limit)
        @cache.save(primes[primes.index_of(@cache.last)..-1])
        return primes
      end
    end
  end
end