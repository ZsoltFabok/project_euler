module Math
  class Prime
    def factorisation(number)
      current_prime = 2
      primes = []
      while (number != 1)
        if number % current_prime == 0
          primes << current_prime
          number /= current_prime
        else
          current_prime = next_prime(current_prime)
        end
      end
      primes
    end

    def next_prime(number)
      number += 1
      while (!is_prime?(number)) do
        number += 1
      end
      number
    end

    # uses Fermat's little theorem, with a = 2
    def is_prime?(number)
      a = 2
      if (a ** (number - 1) - 1) % number == 0
        if is_pseudoprime?(number)
          return false
        end
        return true
      end
      return  false
    end

    protected
    def is_pseudoprime?(number)
      number_sqrt = Math.sqrt(number).to_i
      divisors = (1..number_sqrt).to_a.delete_if do |n|
        is_composite_of?(n, [2, 3, 5, 7, 11])
      end

      divisors.each do |n|
        if number % n == 0 && n > 1 # n > 1 makes sure that it works for actual primes in the recursion
          return true
        end
      end
      return false
    end

    def is_composite_of?(n, base_primes)
      base_primes.each do |d|
        if (n % d == 0) && ((n / d) > 1)
          return true
        end
      end
      false
    end
  end
end