module Common
  class Arrays
    def self.sum(array)
      array.inject(:+)
    end

    def self.multiply_elements(array)
      array.inject(:*)
    end
  end
end