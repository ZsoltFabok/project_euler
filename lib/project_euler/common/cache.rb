module Common
  class Cache
    def initialize(data_file, arrays)
      @data_file = data_file
      @arrays = arrays
    end

    def load
      if @cache.nil?
        @cache = []
        @cache = @data_file.read.map {|n| n.to_i}
        @cache.sort!
      end
    end

    def save(number)
      load
      if number.class == Array
        @cache.concat(number)
      else
        @cache << number
      end
      @data_file.save(number)
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

    def enumerator
      load
      Enumerator.new(@cache)
    end

    def self.create
      new(DataFile.new("data/prime_numbers.txt"), Arrays.new)
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