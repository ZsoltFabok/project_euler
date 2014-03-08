module Problems
  # If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
  # The sum of these multiples is 23.
  #
  # Find the sum of all the multiples of 3 or 5 below 1000.
  class Problem1
    def execute(number)
      multiples_of_3_5 = []
      (1..number-1).each do |n|
        if n % 3 == 0 || n % 5 == 0
          multiples_of_3_5 << n
        end
      end
      Common::Arrays.sum(multiples_of_3_5)
    end
  end
end