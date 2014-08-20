module SalesTax
  class Calculator
    include SalesTax::Helpers

    attr_accessor :processors, :items

    def initialize(processors)
      self.processors = processors
    end

    def processors
      @processors ||= []
    end

    def items
      @items ||= []
    end

    def to_a
      self.items.map do |item|
        [ item.quantity, item.product, (item.total + process(item)).format ]
      end
    end

    def tax
      self.items.inject(Money.new(0.0)) { |t, i| t + process(i) }
    end

    def sub_total
      self.items.inject(Money.new(0.0)) { |t, i| t + i.total }
    end

    def total
      self.tax + self.sub_total
    end

  protected
    def process(item)
      self.processors.inject(Money.new(0.0)) { |t, p| t + p.calculate(item) }
    end
  end
end
