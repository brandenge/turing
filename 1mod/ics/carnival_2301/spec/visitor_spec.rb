require 'spec_helper'

RSpec.describe Visitor do
  let(:visitor1) { Visitor.new(*VISITOR1.values) }
  let(:visitor2) { Visitor.new(*VISITOR2.values) }
  let(:visitor3) { Visitor.new(*VISITOR3.values) }

  describe '#initialize' do
    it 'exists' do
      expect(visitor1).to be_a(Visitor)
      expect(visitor2).to be_a(Visitor)
    end
  end

  describe 'attributes - #name, #height, #spending_money, and #preferences' do
    it 'has a name' do
      expect(visitor1.name).to eq(VISITOR1[:name])
      expect(visitor2.name).to eq(VISITOR2[:name])
    end

    it 'has a height' do
      expect(visitor1.height).to eq(VISITOR1[:height])
      expect(visitor2.height).to eq(VISITOR2[:height])
    end

    it 'has spending money' do
      expected1 = VISITOR1[:spending_money].gsub(/[^0-9]/, '').to_i
      expected2 = VISITOR2[:spending_money].gsub(/[^0-9]/, '').to_i
      expect(visitor1.spending_money).to eq(expected1)
      expect(visitor2.spending_money).to eq(expected2)
    end

    it 'has preferences' do
      expect(visitor1.preferences).to eq([])
      expect(visitor2.preferences).to eq([])
    end
  end

  describe '#add_preference' do
    it 'adds a preference to preferences' do
      visitor1.add_preference(:gentle)
      expect(visitor1.preferences).to eq([:gentle])
      visitor1.add_preference(:water)
      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough?' do
    context 'the visitor is taller than the provided argument' do
      it 'returns true' do
        expect(visitor1.tall_enough?(54)).to eq(true)
        expect(visitor3.tall_enough?(54)).to eq(true)
      end
    end

    context 'the visitor is not taller than the provided argument' do
      it 'returns false' do
        expect(visitor2.tall_enough?(54)).to eq(false)
        expect(visitor1.tall_enough?(64)).to eq(false)
      end
    end
  end

  describe '#pay_admission_fee' do
    it 'subtracts the fee from the spending money' do
      visitor1.pay_admission_fee(1)
      expect(visitor1.spending_money).to eq(9)
      visitor2.pay_admission_fee(1)
      expect(visitor2.spending_money).to eq(4)
      visitor1.pay_admission_fee(1)
      expect(visitor1.spending_money).to eq(8)
    end
  end
end
