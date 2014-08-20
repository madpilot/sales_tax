module SalesTax
  class CLI
    def self.run(args)
      calculator = SalesTax::Calculator.new([
        SalesTax::StandardTax,
        SalesTax::ImportTax
      ])

      if args.length == 0
        puts "Usage: sales_tax input_filename"
        exit(1)
      end

      reader = SalesTax::FileReader.new(args[0])

      reader.process do |item|
        calculator.items << item
      end

      SalesTax::CSVWriter.write(calculator)
    rescue => e
      puts e
      exit(1)
    end
  end
end
