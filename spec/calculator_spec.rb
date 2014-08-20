require 'spec_helper'

describe 'Calculator' do
  let(:book) do
    SalesTax::LineItem.new(1, 'book', 12.49, exempt: true, imported: false)
  end

  let(:music_cd) do
    SalesTax::LineItem.new(1, 'music cd', 14.99, exempt: false, imported: false)
  end

  let(:chocolate_bar) do
    SalesTax::LineItem.new(1, 'chocolate bar', 0.85, exempt: true, imported: false)
  end

  let(:imported_box_of_chocolates) do
    SalesTax::LineItem.new(1, 'imported box of chocolates', 10.00, exempt: true, imported: true)
  end

  let(:imported_bottle_of_purfume) do
    SalesTax::LineItem.new(1, 'imported bottle of perfume', 47.50, exempt: false, imported: true)
  end

  let(:imported_bottle_of_perfume_2) do
    SalesTax::LineItem.new(1, 'imported bottle of perfume', 27.99, exempt: false, imported: true)
  end

  let(:bottle_of_perfume) do
    SalesTax::LineItem.new(1, 'bottle of perfume', 18.99, exempt: false, imported: false)
  end

  let(:packet_of_headache_pills) do
    SalesTax::LineItem.new(1, 'packet of headache pills', 9.75, exempt: true, imported: false)
  end

  let(:imported_box_of_chocolates_2) do
    SalesTax::LineItem.new(1, 'imported box of chocolates', 11.25, exempt: true, imported: true)
  end

  let!(:calculator) do
    SalesTax::Calculator.new([
      SalesTax::StandardTax, SalesTax::ImportTax
    ])
  end

  describe 'input 1' do
    before do
      calculator.items = [ book, music_cd, chocolate_bar ]
    end

    it 'should calculate total of all items in cart' do
      expect(calculator.total).to eq(Money.new(2983))
    end

    it 'should calculate tax component of all items in cart' do
      expect(calculator.tax).to eq(Money.new(150))
    end
  end

  describe 'input 2' do
    before do
      calculator.items = [ imported_box_of_chocolates, imported_bottle_of_purfume ]
    end

    it 'should calculate total of all items in cart' do
      expect(calculator.total).to eq(Money.new(6515))
    end

    it 'should calculate tax component of all items in cart' do
      expect(calculator.tax).to eq(Money.new(765))
    end
  end

  describe 'input 3' do
    before do
      calculator.items = [ imported_bottle_of_perfume_2, bottle_of_perfume, packet_of_headache_pills, imported_box_of_chocolates_2 ]
    end

    it 'should calculate total of all items in cart' do
      expect(calculator.total).to eq(Money.new(7468))
    end

    it 'should calculate tax component of all items in cart' do
      expect(calculator.tax).to eq(Money.new(670))
    end
  end

end
