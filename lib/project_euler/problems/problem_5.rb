module Problems
  # 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
  # without any remainder.
  #
  # What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  class Problem5
    # I've check the prime factors of 2520 and it is possible to generate all
    # the numbers from 1 to 10 from them.
    #
    # So I'm taking the prime factors of each element between 1 and 'number' and get
    # their prime factors. After that I'm removing the extra numbers. For example, for
    # number 20 I'll end up with [2, 2, 2, 2, 2, 2, 2, 2] which is too much because I can
    # generate 256 from these 2s. So, I'm reducing the number of 2s until only numbers below 'number'
    # can be generated from them (because I'll need the smallest number)
    def execute(number)
      buckets = []
      (1..number).each do |n|
        Math::Prime.new.factorisation(n).each do |prime_factor|
          bucket = find_bucket(buckets, prime_factor)
          if bucket.nil?
            bucket = []
            buckets << bucket
          end
          bucket << prime_factor
        end
      end
      reduce_bucket_size(buckets, number)
      Common::Arrays.multiply_elements(buckets.flatten)
    end

    private
    def find_bucket(buckets, number)
      buckets.each do |factor_bucket|
        if factor_bucket.size > 0 && factor_bucket[0] == number
          return factor_bucket
        end
      end
      nil
    end

    private
    def reduce_bucket_size(buckets, n)
      buckets.each do |bucket|
        while (Common::Arrays.multiply_elements(bucket) > n) do
          bucket.pop
        end
      end
    end
  end
end