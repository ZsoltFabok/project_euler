module Math
  class PythagoreanTriples
    def find_under(number)
      triples = []
      (1..number).each do |c|
        candidates(c).each do |candidate|
          triples << candidate
        end
      end
      triples = order_by_c(triples)
    end

    def find_primitives_under(number)
      gcd = Math::BinaryGcd.new
      triples = find_under(number)
      return triples.delete_if do |triplet|
        gcd.gcd(triplet[0], triplet[1]) != 1
      end
    end

    private
    def candidates(c)
      candidates = []
      if proper_c?(c)
        (1..c-1).each do |n|
          # Euclid said: a = m^2 - n^2, b = 2mn, c = m^2 + n^2
          m = euclid_m(c, n)
          if m
            a = m**2 - n**2
            b = 2*m*n
            candidates << [a.to_i, b.to_i, c].sort
          end
        end
      end
      return candidates
    end

    def proper_c?(number)
      # All prime factors of c are primes of the form 4n + 1 (source: wikipedia)
      (number - 1) % 4 == 0
    end

    def rational_sqrt?(number)
      x = Math.sqrt(number)
      (x - x.to_i).zero?
    end

    def order_by_c(triples)
      qsort(triples)
    end

    def euclid_m(c, n)
      # Euclid said: a = m^2 - n^2, b = 2mn, c = m^2 + n^2
      m2 = c - n**2
      if m2 > 0 && m2 > n**2 # m > n, therefore m^2 > n^2
        if rational_sqrt?(m2)
          m = Math.sqrt(m2)
          return m
        end
      end
      nil
    end

    def qsort(list)
      return [] if list.size == 0
      x, *xs = *list
      less, more = xs.partition{|y| y[2] < x[2]}
      qsort(less) + [x] + qsort(more)
    end
  end
end