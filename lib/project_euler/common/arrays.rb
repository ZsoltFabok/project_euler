module Common
  class Arrays
    def self.sum(array)
      array.inject(:+)
    end

    def self.multiply(array)
      array.inject(:*)
    end
  end
end