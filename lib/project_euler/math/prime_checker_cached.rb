module Math
  class PrimeCheckerCached < PrimeChecker
    def initialize(cache)
      @cache = cache
    end

    def is_prime?(number)
      if @cache.has?(number)
        return true
      elsif !@cache.empty? && number < @cache.last
        return false
      elsif super(number)
        @cache.save(number)
        return true
      end
      false
    end

    def self.create(cache)
      new(cache)
    end
  end
end