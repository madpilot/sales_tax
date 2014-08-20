module SalesTax
  class Data
    def initialize(path = nil)
      path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'products.yml'))
      @path = path
    end

    def load
      products = YAML.load_file(@path)
      products['products']
    end

    def self.load
      self.new.load
    end
  end
end
