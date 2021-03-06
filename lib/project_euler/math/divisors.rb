module Math
  class Divisors
    def initialize(prime_factors, arrays)
      @prime_factors = prime_factors
      @arrays = arrays
    end

    def number_of_divisors(number)
      factors = @prime_factors.factors(number)
      count_exponents(factors)
    end

    def get(number)
      divisors = [1]
      factors = @prime_factors.factors(number)
      divisors.concat(factors)
      (2..factors.size).each do |i|
        factors.combination(i).each do |combination|
          divisors << @arrays.multiply(combination)
        end
      end
      divisors.uniq
    end

    def self.create
      prime_factors = Math::PrimeFactors.create
      arrays = Common::Arrays.new
      new(prime_factors, arrays)
    end

    private
    def count_exponents(factors)
      count = {}
      factors.each do |factor|
        count[factor] ||= 0
        count[factor] += 1
      end
      @arrays.multiply(count.values.map {|n| n+1})
    end
  end
end