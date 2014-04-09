module Math
  class PrimeGeneratorCached < PrimeGenerator
    def initialize(cache)
      @cache = cache
    end

    def primes(limit)
      if !@cache.empty? && @cache.last >= limit
        limit_index = @cache.find(limit)
        return @cache.sub(0..limit_index)
      else
        primes = super(limit)
        if @cache.empty?
          @cache.save(primes)
        else
          @cache.save(primes[primes.index(@cache.last)+1..-1])
        end
        return primes
      end
    end

    def self.create(cache)
      new(cache)
    end
  end
end