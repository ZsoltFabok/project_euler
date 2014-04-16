module Problems
  # 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
  #
  # What is the sum of the digits of the number 2^1000?
  class Problem16
    def initialize(arrays)
      @arrays = arrays
    end

    def self.execute
      new(Common::Arrays.new).calculate(1000)
    end

    def calculate(number)
      @arrays.sum((2**number).to_s.split('').map {|n| n.to_i})
    end
  end
end