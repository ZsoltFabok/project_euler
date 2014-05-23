require 'date'

module Problems
  # You are given the following information, but you may prefer to do some research for yourself.

  # 1 Jan 1900 was a Monday.
  # Thirty days has September,
  # April, June and November.
  # All the rest have thirty-one,
  # Saving February alone,
  # Which has twenty-eight, rain or shine.
  # And on leap years, twenty-nine.
  # A leap year occurs on any year evenly divisible by 4, but not on a century unless it is
  # divisible by 400.
  # How many Sundays fell on the first of the month during the twentieth century
  # (1 Jan 1901 to 31 Dec 2000)?
  class Problem19
    def self.execute
      new.calculate("1901-01-01", "2000-12-31")
    end

    def calculate(from_date, to_date)
      d1 = Date.parse(from_date)
      d2 = Date.parse(to_date)
      counter = 0
      while (d1 <= d2)
        if d1.cwday == 7 && d1.day == 1
          counter +=1
        end
        d1 += 1
      end
      counter
    end
  end
end