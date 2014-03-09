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

    protected
    def next_prime(number)
      number += 1
      while (!is_prime?(number)) do
        number += 1
      end
      number
    end

    # uses Fermat's little theorem, with a = 2
    def is_prime?(number)
      (2 ** number - 2) % number == 0
    end
  end
end