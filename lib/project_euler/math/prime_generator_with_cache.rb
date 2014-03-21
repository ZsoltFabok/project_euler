module Math
  class PrimeGeneratorWithCache < PrimeGenerator
    def initialize(cache)
      @cache = cache
    end

    def primes(limit)
      if @cache.last >= limit
        return @cache.get_until(limit)
      else
        primes = super(limit)
        @cache.save(primes[primes.index(@cache.last)+1..-1])
        return primes
      end
    end

    def self.create(file_name)
      new(Common::Cache.create(file_name))
    end
  end
end