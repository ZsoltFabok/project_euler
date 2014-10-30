module Math
	class PrimeFactorsCached < PrimeFactors
    def initialize(prime_enumerator)
      super(prime_enumerator)
    end

		def self.create(cache)
			new(PrimeEnumeratorCached.create(cache))
		end
	end
end