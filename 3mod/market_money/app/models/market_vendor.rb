class MarketVendor < ApplicationRecord
  belongs_to :market
  belongs_to :vendor

  validates :market_id, presence: true, numericality: true
  validates :vendor_id, presence: true, numericality: true

  validate :is_unique, on: :create

  def is_unique
    if MarketVendor.where(market_id: market_id)
                   .where(vendor_id: vendor_id).count > 0
      raise CustomError.new("Validation failed: Market vendor association between market with market_id=#{market_id} and vendor_id=#{vendor_id} already exists", 422)
    end
  end
end
