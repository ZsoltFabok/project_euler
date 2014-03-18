module Math
  # uses http://en.wikipedia.org/wiki/Sieve_of_Atkin
  class PrimeGenerator
    def primes(limit)
      candidates = [false, false, true, true, false]
      end_ = Math.sqrt(limit)
      (5..limit).each do |n|
        candidates[n] = false
      end

      (1..end_).each do |x|
        (1..end_).each do |y|
          n = 4*x**2 + y**2
          if n <= limit && (n % 12 == 1 || n % 12 == 5)
            candidates[n] = !candidates[n]
          end

          n = 3*x**2 + y**2
          if n <= limit && (n % 12 == 7)
            candidates[n] = !candidates[n]
          end

          n = 3*x**2 - y**2
          if x > y && n <= limit && n % 12 == 11
            candidates[n] = !candidates[n]
          end
        end
      end

      candidates.each_with_index do |is_prime, index|
        if is_prime
          number = index**2
          while (number <= limit)
            candidates[number] = false
            number += index**2
          end
        end
      end

      filter_non_primes(candidates)
    end

    private
    def filter_non_primes(candidates)
      candidates.each_with_index.map do |is_prime, index|
        if is_prime
          index
        end
      end.compact
    end
  end
end