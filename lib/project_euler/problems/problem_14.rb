module Problems
	# The following iterative sequence is defined for the set of positive integers:
  #
	# n → n/2 (n is even)
	# n → 3n + 1 (n is odd)
  #
	# Using the rule above and starting with 13, we generate the following sequence:
  #
	# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
	# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
	# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
  #
	# Which starting number, under one million, produces the longest chain?
  #
	# NOTE: Once the chain starts the terms are allowed to go above one million.
	class Problem14
		def initialize(collatz_sequence)
			@collatz_sequence = collatz_sequence
		end

		def self.execute
			new(Math::CollatzSequence.new).calculate(1000000)
		end

		def calculate(number)
			max_length = 0
			number_with_max_length = 1
			(1..number).each do |candidate|
				current_length = @collatz_sequence.get(candidate).size
				if current_length > max_length
					max_length = current_length
					number_with_max_length = candidate
				end
			end
			number_with_max_length
		end
	end
end