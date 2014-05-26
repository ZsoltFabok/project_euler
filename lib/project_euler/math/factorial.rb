module Math
  class Factorial
    def get(number)
      # http://rosettacode.org/wiki/Factorial#Ruby
      (1..number).reduce(:*)
    end
  end
end