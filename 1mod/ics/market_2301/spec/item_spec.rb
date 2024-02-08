require 'spec_helper'

RSpec.describe Item do
  let(:item1) { Item.new({name: 'Peach', price: '$0.75'}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }

  describe '#initialize' do
    it 'exists' do
      expect(item1).to be_a(Item)
      expect(item2).to be_a(Item)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(item1.name).to eq('Peach')
      expect(item2.name).to eq('Tomato')
    end
  end

  describe '#price' do
    it 'returns a number' do
      expect(item1.price).to be_a(Numeric)
      expect(item2.price).to be_a(Numeric)
    end

    it 'has a price' do
      expect(item1.price).to eq(0.75)
      expect(item2.price).to eq(0.5)
    end
  end
end
