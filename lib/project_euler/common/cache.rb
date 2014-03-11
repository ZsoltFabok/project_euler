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
      @cache << number
      File.open(@file_name, "a+") do |f|
        f.write("#{number}\n")
      end
    end

    def has?(number)
      load
      @cache.include?(number)
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
  end
end