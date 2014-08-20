module SalesTax
  class FileReader < Reader
    def initialize(file)
      @file = file
    end

    def process
      File.open(@file, "r").each_line do |line|
        item = parse(line)
        yield item unless item.nil?
      end
    end
  end
end
