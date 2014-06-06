module Problems
  # Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names,
  # begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this
  # value by its alphabetical position in the list to obtain a name score.
  #
  # For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53,
  # is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
  #
  # What is the total of all the name scores in the file?
  class Problem22
    def initialize(data_file, word, letter)
      @data_file = data_file
      @letter = letter
      @word = word
    end

    def self.execute
      new(Common::DataFile.new("data/problem_22_input.txt"), Common::Word.new, Common::Letter.new).calculate
    end

    def calculate
      total = 0
      words = @data_file.read[0].split(',').map {|s| s[1..-2]}.sort
      words.each_with_index do |word, index|
        sum = 0
        @word.to_letters(word).each do |c|
          sum += @letter.to_number(c)
        end
        sum *= index + 1
        total += sum
      end
      total
    end
  end
end