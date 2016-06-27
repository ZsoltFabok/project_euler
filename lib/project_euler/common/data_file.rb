module Common
  class DataFile
    def initialize(file_name)
      @file_name = file_name
    end

    def read
      data = []
      File.open(@file_name, "r") do |f|
        f.readlines.each do |line|
          data << line
        end
      end
      data
    end

    def save(data)
      if data.class == Array
        File.open(@file_name, "a+") do |f|
          data.each do |n|
            f.write("#{n}\n")
          end
        end
      else
        File.open(@file_name, "a+") do |f|
          f.write("#{data}\n")
        end
      end
    end
  end
end