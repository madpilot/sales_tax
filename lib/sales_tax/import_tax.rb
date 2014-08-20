module SalesTax
  class ImportTax
    extend SalesTax::Helpers

    def self.calculate(item)
      return Money.new(0) unless item.imported
      tax_round(tax_component(item.total, 5.0))
    end
  end
end
