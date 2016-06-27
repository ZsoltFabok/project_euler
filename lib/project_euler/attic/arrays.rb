module Attic
  class Arrays
    def self.variations(array)
      variations = []
      inner_variations(array, [], variations)
      variations
    end

    private
    def self.inner_variations(array, buffer, result)
      array.each_index do |index|
        buffer << array[index]
        if array.size > 1
          new_array = create_array_without_element_at(array, index)
          inner_variations(new_array, buffer, result)
        else
          result << Array.new(buffer)
        end
        buffer.pop
      end
    end

    def self.create_array_without_element_at(array, index)
      new_array = Array.new(array)
      new_array.delete_at(index)
      new_array
    end
  end
end