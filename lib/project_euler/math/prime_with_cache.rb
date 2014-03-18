module Math
  class PrimeWithCache < Prime
    def initialize(cache)
      @cache = cache
    end

    def is_prime?(number)
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
      @cache.size
    end

    def next_unknown_prime
      if @cache.last
        next_prime(@cache.last)
      else
        @cache.save(2)
        return 2
      end
    end

    def position_in_cache(number)
      index = @cache.find(number)
    end

    def prime_at_position(position)
      @cache.at(position)
    end
  end
end