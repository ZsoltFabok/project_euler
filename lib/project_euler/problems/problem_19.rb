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

    # Note: I won't use the date function to get the week day of a certain date
    def calculate(from_date, to_date)
      calendar_days_between(from_date, to_date)
    end

    private
    def number_of_days_before(date)
      year, month = parse("1900-01-01")
      number_of_days_before = 0 # 1900.01.01 was a Monday
      while (to_date(year, month) < date)
        number_of_days_before += numbers_of_days_in_month(year)[month-1]
        if month == numbers_of_days_in_month(year).size
          month = 0
          year+=1
        end
        month+=1
      end
      number_of_days_before
    end

    def calendar_days_between(from_date, to_date, &action)
      first_month_of_the_month_is_sunday = 0
      first_day_of_the_month = number_of_days_before(from_date)

      year, month = parse(from_date)
      to_year, to_month = parse(to_date)
      while (to_date(year, month) <= to_date(to_year, to_month-1))
        first_day_of_the_month += numbers_of_days_in_month(year)[month-1]
        if first_day_of_the_month % 7 == 6
          first_month_of_the_month_is_sunday +=1
        end
        if month == numbers_of_days_in_month(year).size
          month = 1
          year+=1
        else
          month+=1
       end
      end
      first_month_of_the_month_is_sunday
    end

    def numbers_of_days_in_month(year)
      february = 28
      if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
        february = 29
      end

      [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end

    def parse(date)
      date =~ /([0-9]+)-([0-9]+)/
      [$1.to_i, $2.to_i]
    end

    def to_date(year, month)
      "#{year}-#{month.to_s.rjust(2,'0')}-01"
    end
  end
end