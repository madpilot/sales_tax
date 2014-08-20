module SalesTax
  module Helpers
    def tax_component(amount, percent)
      amount * (percent / 100.0)
    end

    def round(dollars)
      (dollars * 100.0).round / 100.0
    end

    def tax_round(dollars)
      cents = dollars.cents.to_s

      case cents[-1].to_i
      when 1..4
        cents = (cents[0..-2] + '0').to_i
      when 5..9
        cents = (cents[0..-2] + '0').to_i + 10
      end

      Money.new(cents)
    end
  end
end
