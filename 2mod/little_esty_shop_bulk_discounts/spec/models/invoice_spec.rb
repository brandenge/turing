require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
  end

  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:merchants).through(:items) }
  end

  describe "instance methods" do
    describe '#total_revenue' do
      it "returns the total_revenue of the invoice" do
        merchant1 = Merchant.create!(name: 'Hair Care')
        item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: merchant1.id, status: 1)
        item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: merchant1.id)
        customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
        invoice_1 = Invoice.create!(customer_id: customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
        ii_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 9, unit_price: 10, status: 2)
        ii_11 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_8.id, quantity: 1, unit_price: 10, status: 1)

        expect(invoice_1.total_revenue).to eq(100)
      end
    end

    describe '#merchant_total_revenue' do
      it 'returns only the merchants revenue from an invoice' do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        item1 = create(:item, merchant_id: merchant1.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant2.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)
        invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)

        expect(invoice.merchant_total_revenue(merchant1.id)).to eq(100)
        expect(invoice.merchant_total_revenue(merchant2.id)).to eq(150)
      end
    end

    describe '#merchant_discounted_amount' do
      it 'returns the merchant\'s discounted revenue for an invoice' do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        item1 = create(:item, merchant_id: merchant1.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant2.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)
        invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)
        discount = create(:discount, merchant_id: merchant1.id, quantity: 10, percentage: 10)

        expect(invoice.merchant_discounted_amount(merchant1.id)).to eq(10)
        expect(invoice.merchant_discounted_amount(merchant2.id)).to eq(0)
      end
    end

    describe '#merchant_total_discounted_revenue' do
      it 'returns the total revenue for an invoice after discounts are applied' do
        merchant = create(:merchant)
        item1 = create(:item, merchant_id: merchant.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 9, unit_price: 10, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)
        discount = create(:discount, merchant_id: merchant.id, quantity: 10, percentage: 10)

        expect(invoice.merchant_total_discounted_revenue(merchant.id)).to eq(225)
      end

      it 'returns only the merchant\'s total revenue for an invoice after discounts are applied' do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        item1 = create(:item, merchant_id: merchant1.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant2.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)
        invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)
        discount = create(:discount, merchant_id: merchant1.id, quantity: 10, percentage: 10)

        expect(invoice.merchant_total_discounted_revenue(merchant1.id)).to eq(90)
        expect(invoice.merchant_total_discounted_revenue(merchant2.id)).to eq(150)
      end

      it 'only applies the highest discount if more than one discount applies' do
        merchant = create(:merchant)
        item1 = create(:item, merchant_id: merchant.id, unit_price: 10)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)

        discount1 = create(:discount, merchant_id: merchant.id, quantity: 10, percentage: 10)
        discount2 = create(:discount, merchant_id: merchant.id, quantity: 10, percentage: 20)

        expect(invoice.merchant_total_discounted_revenue(merchant.id)).to eq(80)
      end
    end

    describe '#discounted_amount' do
      it 'returns the discounted amount for all the items on an invoice, even for invoices with multiple merchants' do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        item1 = create(:item, merchant_id: merchant1.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant2.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)
        invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)
        discount1 = create(:discount, merchant_id: merchant1.id, quantity: 10, percentage: 10)
        discount2 = create(:discount, merchant_id: merchant2.id, quantity: 10, percentage: 20)

        expect(invoice.discounted_amount).to eq(40)
      end
    end

    describe '#total_discounted_revenue' do
      it 'returns the total revenue for an invoice after discounts are applied' do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        item1 = create(:item, merchant_id: merchant1.id, unit_price: 10)
        item2 = create(:item, merchant_id: merchant2.id, unit_price: 15)
        customer = create(:customer)
        invoice = create(:invoice, customer_id: customer.id, status: 2)
        invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id, quantity: 10, unit_price: 10, status: 2)
        invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id, quantity: 10, unit_price: 15, status: 2)
        discount1 = create(:discount, merchant_id: merchant1.id, quantity: 10, percentage: 10)
        discount2 = create(:discount, merchant_id: merchant2.id, quantity: 10, percentage: 20)

        expect(invoice.total_discounted_revenue).to eq(210)
      end
    end
  end
end
