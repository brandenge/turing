require 'spec_helper'

RSpec.describe Vendor do
  let(:item1) { Item.new({name: 'Peach', price: '$0.75'}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
  let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
  let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }

  let(:vendor1) { Vendor.new('Rocky Mountain Fresh') }
  let(:vendor2) { Vendor.new('Ba-Nom-a-Nom') }
  let(:vendor3) { Vendor.new('Palisade Peach Shack') }

  before(:each) do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
  end

  describe '#initialize' do
    it 'exists' do
      expect(vendor1).to be_a(Vendor)
      expect(vendor2).to be_a(Vendor)
      expect(vendor3).to be_a(Vendor)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(vendor1.name).to eq('Rocky Mountain Fresh')
      expect(vendor2.name).to eq('Ba-Nom-a-Nom')
      expect(vendor3.name).to eq('Palisade Peach Shack')
    end
  end

  describe '#inventory' do
    it 'returns a hash' do
      expect(vendor1.inventory).to be_a(Hash)
      expect(vendor2.inventory).to be_a(Hash)
      expect(vendor3.inventory).to be_a(Hash)
    end

    it 'returns the vendor\'s inventory' do
      expected1 = {
        item1 => 35,
        item2 => 7
      }
      expected2 = {
        item4 => 50,
        item3 => 25
      }
      expected3 = {
        item1 => 65
      }

      expect(vendor1.inventory).to eq(expected1)
      expect(vendor2.inventory).to eq(expected2)
      expect(vendor3.inventory).to eq(expected3)
    end
  end

  describe '#check_stock' do
    it 'returns the amount of stock of the given item in the vendor\'s inventory' do
      expect(vendor1.check_stock(item1)).to eq(35)
      expect(vendor1.check_stock(item2)).to eq(7)
      expect(vendor3.check_stock(item3)).to eq(0)
    end
  end

  describe '#stock' do
    it 'adds the given quantity of the given item to inventory' do
      vendor = Vendor.new('New Vendor')
      vendor.stock(item1, 30)
      expect(vendor.check_stock(item1)).to eq(30)

      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)

      vendor.stock(item2, 12)
      expect(vendor.check_stock(item2)).to eq(12)
    end
  end

  describe '#potential_revenue' do
    it 'returns the total potential revenue from the vendor\'s inventory' do
      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  end
end
