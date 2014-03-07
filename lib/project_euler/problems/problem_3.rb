module Problems
  # The prime factors of 13195 are 5, 7, 13 and 29.
  #
  # What is the largest prime factor of the number 600851475143 ?
  class Problem3

    def execute(number)
      @current_prime = 2
      primes = []
      while (number != 1)
        if number % @current_prime == 0
          primes << @current_prime
          number /= @current_prime
        else
          @current_prime = next_prime(@current_prime)
        end
        puts "#{number}, #{@current_prime}, #{primes.to_s}"
      end
      primes.last
    end

    private
    def next_prime(n)
      n += 1
      while (!is_prime?(n)) do
        n += 1
      end
      n
    end

    def factorial(n)
      # http://rosettacode.org/wiki/Factorial#Ruby
      (1..n).reduce(:*)
    end

    def is_prime?(n)
      (factorial(n-1)+1) % n == 0
    end
  end
end