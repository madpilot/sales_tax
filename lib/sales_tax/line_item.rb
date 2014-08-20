module SalesTax
  class LineItem
    attr_accessor :quantity, :product, :price, :exempt, :imported

    def initialize(quantity, product, price, options = {})
      options = { :exempt => false, :imported => false }.merge(options)
      self.quantity = quantity
      self.product = product
      self.price = Money.new(price * 100)
      self.exempt = options[:exempt]
      self.imported = options[:imported]
    end

    def total
      self.price * self.quantity
    end
  end
end
