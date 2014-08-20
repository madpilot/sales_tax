module SalesTax
  class StandardTax
    extend SalesTax::Helpers

    def self.calculate(item)
      return Money.new(0) if item.exempt
      tax_component(item.total, 10.0)
    end
  end
end
