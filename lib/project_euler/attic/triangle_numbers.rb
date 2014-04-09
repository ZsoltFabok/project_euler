module Attic
  class TriangleNumbers
    def initialize(arrays)
      @arrays = arrays
    end

    def next
      if @last == nil
        @last = 1
        return @last
      else
        @last += 1
        return @arrays.sum((1..@last).to_a)
      end
    end

    def self.create
      new(Common::Arrays.new)
    end
  end
end