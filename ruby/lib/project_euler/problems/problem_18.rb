module Problems
	# By starting at the top of the triangle below and moving to adjacent numbers on the row below,
	# the maximum total from top to bottom is 23.
  #
	#    3
	#   7 4
	#  2 4 6
	# 8 5 9 3
	#
	# That is, 3 + 7 + 4 + 9 = 23.
  #
	# Find the maximum total from top to bottom of the triangle below:
	class Problem18
		def self.execute
			s = "
			  75
				95 64
				17 47 82
				18 35 87 10
				20 04 82 47 65
				19 01 23 75 03 34
				88 02 77 73 07 63 67
				99 65 04 28 06 16 70 92
				41 41 26 56 83 40 80 70 33
				41 48 72 33 47 32 37 16 94 29
				53 71 44 65 25 43 91 52 97 51 14
				70 11 33 28 77 73 17 78 39 68 17 57
				91 71 52 38 17 14 91 43 58 50 27 29 48
				63 66 04 68 89 53 67 30 73 16 69 87 40 31
				04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
			new.calculate(s)
		end

		# Given a single triangle:
		#  3
		# 7 4
		# in this case the max path is either 7+3 or 4+3, or in other words
		# [7, 4].max + 3
		# with this approach I can calculate local maximums.
		#
		# to calculate the overall maximum, I'm replacing 3 with its possible maximum
		# value which is [7, 4].max + 3 -> 10. I'm doing this for each single small triangle
		# from left to right, the bottom to up and the final result will be at the top.
		def calculate(structure)
			structure = string_to_structure(structure)
			(structure.size-1).downto(1).each do |j|
				(0..structure[j].size-2).each do |i|
					structure[j-1][i] += [structure[j][i], structure[j][i+1]].max
				end
			end
			structure[0][0]
		end

		private
		def string_to_structure(string)
			structure = []
			count = 1
			buffer = string.split(' ').map {|n| n.to_i}
			while !buffer.empty? do
				structure << buffer.shift(count)
				count+=1
			end
			structure
		end
	end
end