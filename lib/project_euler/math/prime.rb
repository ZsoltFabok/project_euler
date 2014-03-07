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

    # uses Wilson's Theorem
    def is_prime?(number)
      (Math::Factorial.get(number-1)+1) % number == 0
    end
  end
end