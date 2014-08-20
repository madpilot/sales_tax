require 'bundler'
Bundler.require

# Eliminate a deprecation warning
I18n.enforce_available_locales = false

%w(helpers line_item calculator standard_tax import_tax data cli reader file_reader csv_writer').each do |file|
  require File.join(File.dirname(__FILE__), 'sales_tax', file)
end


module SalesTax; end
