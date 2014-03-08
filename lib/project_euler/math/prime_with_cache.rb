module Math
  class PrimeWithCache < Prime
    def initialize
      @cache_file_name = "data/prime_numbers.txt"
    end

    def initialize(cache_file_name)
      @cache_file_name = cache_file_name
    end

    def is_prime?(number)
      if @cache.nil?
        load_cache
      end

      if @cache.include?(number)
        return true
      elsif !@cache.include?(number) && number < @cache.last
        return false
      elsif super(number)
        save_in_cache(number)
        return true
      end
      false
    end

    private
    def load_cache
      @cache = []
      File.open(@cache_file_name, "r") do |f|
        f.readlines.each do |line|
          @cache << line.to_i
        end
      end
    end

    def save_in_cache(number)
      File.open(@cache_file_name, "a+") do |f|
        f.write("#{number}\n")
      end
    end
  end
end