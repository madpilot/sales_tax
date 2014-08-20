module SalesTax
  class Reader
    def data
      @data ||= SalesTax::Data.load
    end

    def parse(line)
      line = (line || '').gsub(',', ' ').strip

      if line =~ /^(\d+)\s+(.+)\s+(\d*\.\d{2})\s*$/
        qty = Regexp.last_match[1].strip.to_i
        product = Regexp.last_match[2].strip
        price = Regexp.last_match[3].strip.to_f

        # look up item in lookup table
        item = data[product]
        if item
          LineItem.new(qty, product, price, {
            :imported => item['imported'],
            :exempt => item['exempt']
          })
        end
      end
    end
  end
end
