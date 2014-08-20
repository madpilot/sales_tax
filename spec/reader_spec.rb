require 'spec_helper'

describe 'Reader' do
  it 'should ignore lines without a quantity' do
    item = SalesTax::Reader.new.parse("Quantity, Product, Price")
    expect(item).to be_nil
  end

  it 'should parse correctly formed lines' do
    item = SalesTax::Reader.new.parse("1, book, 12.49")
    expect(item.quantity).to eq(1)
    expect(item.product).to eq('book')
    expect(item.price).to eq(Money.new(1249))
  end

  it 'should parse lines with missing commas' do
    item = SalesTax::Reader.new.parse("1 chocolate bar, 0.85")
    expect(item.quantity).to eq(1)
    expect(item.product).to eq('chocolate bar')
    expect(item.price).to eq(Money.new(85))
  end
end
