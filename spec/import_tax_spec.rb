require 'spec_helper'

describe 'ImportTax' do
  it 'should return 0 of price for local items' do
    item = SalesTax::LineItem.new(1, 'item', 12.49, exempt: false, imported: false)
    expect(SalesTax::ImportTax.calculate(item)).to eq(Money.new(0))
  end

  it 'should return 5% of price for imported items' do
    item = SalesTax::LineItem.new(1, 'item', 12.49, exempt: false, imported: true)
    expect(SalesTax::ImportTax.calculate(item)).to eq(Money.new(60))
  end

  it 'should multiple result by quantity' do
    item = SalesTax::LineItem.new(2, 'item', 12.49, exempt: false, imported: true)
    expect(SalesTax::ImportTax.calculate(item)).to eq(Money.new(130))
  end
end
