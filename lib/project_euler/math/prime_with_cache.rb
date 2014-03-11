module Math
  class PrimeWithCache < Prime
    def initialize(cache)
      @cache = cache
    end

    def is_prime?(number)
      @cache.load
      if @cache.has?(number)
        return true
      elsif !@cache.has?(number) && number < @cache.last
        return false
      elsif super(number)
        @cache.save(number)
        return true
      end
      false
    end

    def number_of_known_primes
      @cache.load
      @cache.size
    end

    def next_unknown_prime
      @cache.load
      if @cache.last
        next_prime(@cache.last)
      else
        @cache.save(2)
        return 2
      end
    end

    def position_in_cache(number)
      @cache.load
      index = @cache.find(number)
    end

    def prime_at_position(position)
      @cache.load
      @cache.at(position)
    end
  end
end