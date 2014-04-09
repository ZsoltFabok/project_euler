module Math
	class PrimeFactors
		def initialize(prime_enumerator)
			@prime_enumerator = prime_enumerator
		end

		def factors(number)
      prime_enumerator = @prime_enumerator.reset
      current_prime = 2
      primes = []
      while (number != 1)
        if number % current_prime == 0
          primes << current_prime
          number /= current_prime
        else
          current_prime = @prime_enumerator.next
        end
      end
      primes
    end

    def self.create
    	new(Math::PrimeEnumerator.create)
    end
	end
end