module Math
  # implementation based on
  #  - http://en.wikipedia.org/wiki/Binary_GCD_algorithm
  #  - http://en.wikipedia.org/wiki/Greatest_common_divisor
  class BinaryGcd
    def gcd(u, v)
      if u == v
        return v
      elsif u == 0
        return v
      elsif v == 0
        return u
      end

      if u.even? && v.even?
        return gcd(u / 2, v / 2) * 2
      elsif u.even? && v.odd?
        return gcd(u / 2, v)
      elsif u.odd? && v.even?
        return gcd(u, v / 2)
      else
        if u >= v
          return gcd((u - v) / 2, v)
        else
          return gcd((v - u) /2, u)
        end
      end
    end
  end
end