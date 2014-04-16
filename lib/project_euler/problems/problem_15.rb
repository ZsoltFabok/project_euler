module Problems
	# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
	# there are exactly 6 routes to the bottom right corner.
	#
	# How many such routes are there through a 20×20 grid?
	class Problem15
		def self.execute
			new.calculate(20)
		end

    # Using combinatorics. There are 2 kinds of steps in a grid: Down and Right and 4 slots. For example,
    # DDRR, DRDR etc. This can be written up as a binomial coefficient : (n k) where
    # n -> number of slots (2*N)
    # k -> number of Ds (or Rs)
    #
    # (n k) = n! * (k! * (n-k)!) = (n*(n-1)*(n-2)* ... *(n-k+1)) / (k*(k-1)*(k-2)*...*1)
		def calculate(number)
		  n = number*2
	  	k = number
	  	((n-k+1)..(n)).inject(:*) / (1..k).inject(:*)
		end
	end
end