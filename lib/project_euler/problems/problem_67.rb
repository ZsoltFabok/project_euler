module Problems
  # By starting at the top of the triangle below and moving to adjacent numbers on the row below,
  # the maximum total from top to bottom is 23.
  #
  #    3
  #   7 4
  #  2 4 6
  # 8 5 9 3
  #
  # That is, 3 + 7 + 4 + 9 = 23.
  #
  # Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'),
  # a 15K text file containing a triangle with one-hundred rows.
  class Problem67
    def initialize(problem18, data_file)
      @problem18 = problem18
      @data_file = data_file
    end

    def self.execute
      new(Problems::Problem18.new, Common::DataFile.new("data/problem_67_input.txt")).calculate
    end

    def calculate
      structure = load_numbers_string_from_input_file
      @problem18.calculate(structure)
    end

    private
    def load_numbers_string_from_input_file
      numbers = ""
      @data_file.read.each do |entry|
        numbers << entry << " "
      end
      numbers.chop
    end
  end
end