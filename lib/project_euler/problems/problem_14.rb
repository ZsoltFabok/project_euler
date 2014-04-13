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
		def self.execute
			new.calculate(1000000)
		end

		# The method uses a cache to reduce calculation time: if it finds a number
		# that already has a calculated length, it will stop and simply add the so
		# far calculated length to the pre-cached calculated length.
		# Moreover, it skips even numbers, because the longest sequenceses start
		# with an odd number.
		def calculate(number)
			number_with_max_length = 1
			lengths = {1=>1, 2=>2}
			(3..number).step(2).each do |n|
				length = 0
				entry = n
				while !lengths.key?(entry) do
					entry = collatz_sequence_next_element(entry)
					length += 1
				end

				lengths[n] = length + lengths[entry]

				if lengths[number_with_max_length] < lengths[n]
					number_with_max_length = n
				end
			end
			return number_with_max_length
		end

		private
		def collatz_sequence_next_element(entry)
			if entry.even?
				entry /= 2
			else
				entry = entry * 3 + 1
			end
			entry
		end
	end
end