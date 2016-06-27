module Math
	class PrimeEnumeratorCached < PrimeEnumerator
		def initialize(cache)
      super(Math::PrimeCheckerCached.create(cache))
			@cache = cache
      @enumerator = @cache.enumerator
    end

    def next
      next_element = @enumerator.next
      if next_element.nil?
      	next_element = next_after(@cache.last)
      end
      next_element
    end

    def reset
      @enumerator.reset
    end

    def self.create(cache)
    	new(cache)
    end
	end
end