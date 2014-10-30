module Common
  class Letter
    ALPHABET =  %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    def to_number(char)
      ALPHABET.find_index(char) + 1
    end
  end
end