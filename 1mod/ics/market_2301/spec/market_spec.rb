require 'spec_helper'

RSpec.describe Market do
  let(:item1) { Item.new({name: 'Peach', price: '$0.75'}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
  let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
  let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }

  let(:vendor1) { Vendor.new('Rocky Mountain Fresh') }
  let(:vendor2) { Vendor.new('Ba-Nom-a-Nom') }
  let(:vendor3) { Vendor.new('Palisade Peach Shack') }

  subject(:market) { Market.new('South Pearl Street Farmers Market') }

  before(:each) do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(market).to be_a(Market)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(market.name).to eq('South Pearl Street Farmers Market')
    end
  end

  describe '#vendors' do
    it 'returns an array' do
      expect(market.vendors).to be_a(Array)
    end

    it 'returns a list of vendors' do
      actual = market.vendors.all? { |vendor| vendor.is_a?(Vendor) }
      expect(actual).to eq(true)
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end

  describe '#add_vendor' do
    it 'adds the given vendor to the market\'s list of vendors' do
      market1 = Market.new('New Market')
      market1.add_vendor(vendor1)
      expect(market1.vendors).to eq([vendor1])

      market1.add_vendor(vendor2)
      expect(market1.vendors).to eq([vendor1, vendor2])

      market1.add_vendor(vendor3)
      expect(market1.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end

  describe '#vendor_names' do
    expected = [
      'Rocky Mountain Fresh',
      'Ba-Nom-a-Nom',
      'Palisade Peach Shack'
    ]

    it 'returns a list of names of the market\'s vendors' do
      expect(market.vendor_names).to eq(expected)
    end
  end

  describe '#vendors_that_sell' do
    it 'returns a list of vendors that have stock for the given item' do
      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe '#sorted_item_list' do
    it 'returns a sorted list of item names for all items in the market' do
      expected = [
        'Banana Nice Cream',
        'Peach',
        'Peach-Raspberry Nice Cream',
        'Tomato'
      ]
      expect(market.sorted_item_list).to eq(expected)
    end
  end

  describe '#items' do
    it 'returns an array of all items in the market' do
      expect(market.items).to eq([item1, item2, item4, item3])
    end
  end

  describe '#check_stock' do
    it 'returns the total stock of the given item in the market' do
      expect(market.check_stock(item1)).to eq(100)
      expect(market.check_stock(item2)).to eq(7)
      expect(market.check_stock(item3)).to eq(25)
      expect(market.check_stock(item4)).to eq(50)
    end
  end

  describe '#total_inventory' do
    it 'returns the inventory of the market' do
      expected = {
        item1 => {
          quantity: 100,
          vendors: [vendor1, vendor3]
        },
        item2 => {
          quantity: 7,
          vendors: [vendor1]
        },
        item3 => {
          quantity: 25,
          vendors: [vendor2]
        },
        item4 => {
          quantity: 50,
          vendors: [vendor2]
        }
      }
      expect(market.total_inventory).to eq(expected)
    end
  end

  describe '#overstocked_items' do
    it 'returns a list of overstocked items' do
      expect(market.overstocked_items).to eq([item1])
    end
  end

  describe '#date' do
    it 'returns a Date object' do
      expect(market.date).to be_a(Date)
    end

    it 'returns today\'s date' do
      expect(market.date).to eq(Date.today)
    end
  end

  describe '#sell' do
    context 'there IS NOT enough market stock to satisfy the given quantity' do
      it 'returns false' do
        expect(market.sell(item2, 40)).to eq(false)
      end

      it 'does not sell anything' do
        expect(market.total_inventory[item2][:quantity]).to eq(7)
        market.sell(item2, 40)
        expect(market.total_inventory[item2][:quantity]).to eq(7)
      end
    end

    context 'there IS enough market stock to satisfy the given quantity' do
      it 'returns true' do
        expect(market.sell(item1, 40)).to eq(true)
      end

      it 'sells the given item for the given quantity' do
        expect(market.total_inventory[item1][:quantity]).to eq(100)
        market.sell(item1, 40)
        expect(market.total_inventory[item1][:quantity]).to eq(60)
      end

      it 'sells the given item from the vendors in the order that the vendors were added to the market' do
        expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
        expect(vendor1.check_stock(item1)).to eq(35)
        expect(vendor3.check_stock(item1)).to eq(65)

        market.sell(item1, 40)

        expect(market.vendors_that_sell(item1)).to eq([vendor3])
        expect(vendor1.check_stock(item1)).to eq(0)
        expect(vendor3.check_stock(item1)).to eq(60)
      end
    end
  end
end
