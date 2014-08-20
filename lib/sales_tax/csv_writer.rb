require 'csv'

module SalesTax
  class CSVWriter
    def self.write(calculator)
      out = CSV.generate do |csv|
        csv << [ 'Quantity', 'Product', 'Price' ]
        calculator.to_a.each do |item|
          csv << item
        end
        csv << []
        csv <<  [ 'Sales Taxes:', calculator.tax.format ]
        csv << [ 'Total:', calculator.total.format ]
      end

      puts out
    end
  end
end
