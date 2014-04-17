module Common
  class Number
    def is_palindromic?(number)
      number.to_s == number.to_s.reverse
    end

    def in_letters(number)
    	letters = ""
    	number, letters = handle_the_places_above(1000, number, letters, " ")
    	number, letters = handle_the_places_above( 100, number, letters, " and ")
			number, letters = handle_the_places_above(  20, number, letters, "-")
			number, letters = handle_the_leftover(number, letters)

			letters
    end

    private
		def handle_the_places_above(places, number, letters, separator)
			if number >= places
				if places != 20
					letters += "#{NUMBERS_TO_LETTERS[number / places]} #{NUMBERS_TO_LETTERS[places]}"
				else
					places = 10
					letters += "#{NUMBERS_TO_LETTERS[(number / places) * places]}"
				end
				if number % places != 0
					letters << separator
				end
				number -= (number / places) * places
			end
			[number, letters]
		end

		def handle_the_leftover(number, letters)
			if number > 0
				letters += "#{NUMBERS_TO_LETTERS[number]}"
			end
			[number, letters]
		end

    NUMBERS_TO_LETTERS =
				{1 => "one",
		     2 => "two",
		     3 => "three",
		     4 => "four",
		     5 => "five",
		     6 => "six",
		     7 => "seven",
		     8 => "eight",
		     9 => "nine",
		     10 => "ten",
		     11 => "eleven",
		     12 => "twelve",
		     13 => "thirteen",
		     14 => "fourteen",
		     15 => "fifteen",
		     16 => "sixteen",
		     17 => "seventeen",
		     18 => "eighteen",
		     19 => "nineteen",
		     20 => "twenty",
		     30 => "thirty",
		     40 => "forty",
		     50 => "fifty",
		     60 => "sixty",
		     70 => "seventy",
		     80 => "eighty",
		     90 => "ninety",
		     100 => "hundred",
		     1000 => "thousand"
				}

  end
end
