#day 3

module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do | row |
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each do |row|
        yield CsvRow.new(@headers, row)
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end

  class CsvRow
    def initialize(headers, row)
      @headers = headers
      @row = row
    end

    def method_missing name, *args
      column_index = 
      @row[ @headers.index name.to_s || @headers.length]

    end

    def inspect
      @headers.join(", ") + "\n" + @row.join(", ")
    end 

  end

end

class RubyCsv # no inheritance! you can mix it in 
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect
m.each{ |row| puts row.description }

