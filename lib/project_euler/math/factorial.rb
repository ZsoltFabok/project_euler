module Math
  class Factorial
    def self.get(number)
      # http://rosettacode.org/wiki/Factorial#Ruby
      (1..number).reduce(:*)
    end
  end
end