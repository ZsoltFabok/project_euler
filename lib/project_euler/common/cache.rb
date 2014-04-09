module Common
  class Cache
    def initialize(file_name, arrays)
      @file_name = file_name
      @arrays = arrays
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

    def empty?
      load
      @cache.empty?
    end

    def has?(number)
      load
      find(number) != nil
    end

    def sub(range)
      load
      @cache[range]
    end

    def last
      load
      @cache.last
    end

    def find(number)
      load
      @arrays.binary_search(number, @cache)
    end

    # def get(position)
    #   load
    #   @cache[position]
    # end

    def enumerator
      load
      Enumerator.new(@cache)
    end

    def self.create
      new("data/prime_numbers.txt", Common::Arrays.new)
    end

    class Enumerator
      def initialize(cache)
        @cache = cache
        reset
      end

      def next
        @cache[@position+=1]
      end

      def reset
        @position = -1
      end
    end
  end
end