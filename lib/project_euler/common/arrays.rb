module Common
  class Arrays
    def sum(array)
      array.inject(:+)
    end

    def multiply(array)
      array.inject(:*)
    end

    def binary_search(number, array)
      return nil if array.empty?

      middle_index = array.size / 2
      if number < array[middle_index]
        if number >= array.first
          position = binary_search(number, array[0..middle_index-1])
          if position.nil?
            return nil
          else
            return middle_index - position
          end
        else
          return nil
        end
      elsif number > array[middle_index]
        if number <= array.last
          position = binary_search(number, array[middle_index..-1])
          if position.nil?
            return nil
          else
            return middle_index + position
          end
        else
          return nil
        end
      else
        if array.size == 1
          return -1
        else
          return middle_index
        end
      end
    end
  end
end