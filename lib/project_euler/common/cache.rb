module Common
  class Cache
    def initialize(file_name)
      @file_name = file_name
    end

    def load
      if @cache.nil?
        @cache = []
        File.open(@file_name, "r") do |f|
          f.readlines.each do |line|
            @cache << line.to_i
          end
        end
        @cache.sort!
      end
    end

    def save(number)
      load
      if number.class == Array
        @cache.concat(number)
        File.open(@file_name, "a+") do |f|
          number.each do |n|
            f.write("#{n}\n")
          end
        end
      else
        @cache << number
        File.open(@file_name, "a+") do |f|
          f.write("#{number}\n")
        end
      end
    end

    def has?(number)
      load
      Common::Arrays.binary_search(number, @cache) != nil
    end

    def last
      load
      @cache.last
    end

    def size
      load
      @cache.size
    end

    def find(number)
      load
      @cache.find_index(number)
    end

    def at(index)
      load
      @cache[index]
    end

    def get_until(limit)
      load
      @cache.select {|n| n <= limit}
    end
  end
end