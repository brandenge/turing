class Discount < ApplicationRecord
  validates :percentage, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :merchant
  has_many :invoice_items, through: :merchant
  has_many :invoices, -> { distinct }, through: :invoice_items

  def has_pending_invoices?
    invoices.where(status: 'in progress').joins(:invoice_items).where('invoice_items.quantity >= ?', quantity).any?
  end
end
