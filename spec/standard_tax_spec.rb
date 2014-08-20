require 'spec_helper'

describe 'StandardTax' do
  it 'should return 10% of price for non-exempt items' do
    item = SalesTax::LineItem.new(1, 'item', 12.49, exempt: false, imported: false)
    expect(SalesTax::StandardTax.calculate(item)).to eq(Money.new(125))
  end

  it 'should return 0 of price for exempt items' do
    item = SalesTax::LineItem.new(1, 'item', 12.49, exempt: true, imported: false)
    expect(SalesTax::StandardTax.calculate(item)).to eq(Money.new(0))
  end

  it 'should multiple result by quantity' do
    item = SalesTax::LineItem.new(2, 'item', 12.49, exempt: false, imported: false)
    expect(SalesTax::StandardTax.calculate(item)).to eq(Money.new(250))
  end
end
