module Common
  class Number
    def is_palindromic?(number)
      number.to_s == number.to_s.reverse
    end
  end
end
