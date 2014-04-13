module Attic
	class CollatzSequence
		def get(number)
			sequence = [number]
			entry = number
			while (entry != 1) do
				if entry.even?
					entry /= 2
				else
					entry = entry * 3 + 1
				end
				sequence << entry
			end
			sequence
		end
	end
end