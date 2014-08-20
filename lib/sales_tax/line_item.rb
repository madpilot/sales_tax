module SalesTax
  class LineItem
    attr_accessor :quantity, :product, :price, :exempt, :imported

    def initialize(quantity, product, price, exempt: false, imported: false)
      self.quantity = quantity
      self.product = product
      self.price = Money.new(price * 100)
      self.exempt = exempt
      self.imported = imported
    end

    def total
      self.price * self.quantity
    end
  end
end
