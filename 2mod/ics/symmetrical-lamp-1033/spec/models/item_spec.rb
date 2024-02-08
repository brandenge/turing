require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'instance methods' do
    describe '#customer count' do
      it 'returns the number of customers who have bought the item' do
        expect(@item_1.customer_count).to eq(2)
        expect(@item_2.customer_count).to eq(2)
        expect(@item_3.customer_count).to eq(2)
        expect(@item_4.customer_count).to eq(2)
        expect(@item_5.customer_count).to eq(3)
      end
    end
  end
end
