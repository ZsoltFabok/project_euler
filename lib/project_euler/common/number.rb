module Common
  class Number
    def is_palindromic?(number)
      number.to_s == number.to_s.reverse
    end

    def in_letters(number)
    	letters = ""
			if number >= 1000
				letters += "#{NUMBERS_TO_LETTERS[number / 1000]} #{NUMBERS_TO_LETTERS[1000]}"
				if number % 1000 != 0
					letters << " "
				end
				number -= (number / 1000) * 1000
			end

			if number >= 100
				letters += "#{NUMBERS_TO_LETTERS[number / 100]} #{NUMBERS_TO_LETTERS[100]}"
				if number % 100 != 0
					letters << " and "
				end
				number -= (number / 100) * 100
			end

			if number > 20
				letters += "#{NUMBERS_TO_LETTERS[(number / 10) * 10]}"
				if number % 10 != 0
					letters << "-"
				end
				number -= (number / 10) * 10
			end

			if number > 0
				letters << NUMBERS_TO_LETTERS[number]
			end

			letters
    end

    private
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
