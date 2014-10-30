module Math
	class PrimeEnumerator
		def initialize(prime_checker)
			@prime_checker = prime_checker
			@current = 1
		end

		def reset
			@current = 1
		end

		def next
			@current = next_after(@current)
			@current
		end

		def self.create
			new(PrimeChecker.create)
		end

		protected
		def next_after(number)
			if number.nil? || number == 1
				number = 2
			elsif number.even?
				number+=1
			else
				number+=2
			end
      while (!@prime_checker.is_prime?(number)) do
        number += 2
      end
      return number
		end
	end
end