class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, -> { distinct }, through: :invoice_items
  has_many :merchants, -> { distinct }, through: :items

  enum status: [:cancelled, 'in progress', :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def merchant_total_revenue(merchant_id)
    invoice_items
    .joins(:item)
    .where('items.merchant_id = ?', merchant_id)
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def merchant_discounted_amount(merchant_id)
    InvoiceItem.select('item_total_quantity, max_discount, unit_price')
    .from(invoice_items
      .joins(item: { merchant: :discounts })
      .select('MAX(discounts.percentage) AS max_discount, item_total_quantity, invoice_items.unit_price')
      .where('items.merchant_id = ?', merchant_id)
      .group('discounts.quantity, item_total_quantity, invoice_items.unit_price')
      .having('item_total_quantity >= discounts.quantity')
      .from(invoice_items
        .select('id, unit_price, item_id, invoice_id, SUM(quantity) AS item_total_quantity')
        .group(:item_id, :unit_price, :id, :invoice_id), :invoice_items
      ), :invoice_items)
    .sum('(max_discount/100.0) * item_total_quantity * unit_price')
  end

  def merchant_total_discounted_revenue(merchant_id)
    merchant_total_revenue(merchant_id) - merchant_discounted_amount(merchant_id)
  end

  def discounted_amount
    InvoiceItem.select('item_total_quantity, max_discount, unit_price')
    .from(invoice_items
      .joins(item: { merchant: :discounts })
      .select('MAX(discounts.percentage) AS max_discount, item_total_quantity, invoice_items.unit_price')
      .group('discounts.quantity, item_total_quantity, invoice_items.unit_price')
      .having('item_total_quantity >= discounts.quantity')
      .from(invoice_items
        .select('id, unit_price, item_id, invoice_id, SUM(quantity) AS item_total_quantity')
        .group(:item_id, :unit_price, :id, :invoice_id), :invoice_items
      ), :invoice_items)
    .sum('(max_discount/100.0) * item_total_quantity * unit_price')
  end

  def total_discounted_revenue
    total_revenue - discounted_amount
  end
end
