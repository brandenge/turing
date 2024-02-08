require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'validations' do
    it { should validate_presence_of :percentage }
    it { should validate_presence_of :quantity }
    it { should validate_numericality_of(:percentage).
      only_integer.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(100) }
    it { should validate_numericality_of(:quantity).
      only_integer.
      is_greater_than_or_equal_to(1) }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'instance methods' do
    describe '#has_pending_invoices?' do
      it 'returns true if the discount affects any items with pending invoices' do
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice = create(:invoice, customer: customer, status: 'in progress')
        invoice_item = create(:invoice_item, invoice: invoice, item: item, quantity: 10, unit_price: 100)
        discount = create(:discount, merchant: merchant, quantity: 10)

        expect(discount.has_pending_invoices?).to eq(true)
      end

      it 'returns false if the discount does not affect any items with pending invoices' do
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice = create(:invoice, customer: customer, status: 'completed')
        invoice_item = create(:invoice_item, invoice: invoice, item: item, quantity: 10, unit_price: 100)
        discount = create(:discount, merchant: merchant, quantity: 100)

        expect(discount.has_pending_invoices?).to eq(false)
      end
    end
  end
end
