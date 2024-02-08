class MarketVendorSerializer
  def successfully_added(market_vendor)
    {
      market_id: market_vendor.market_id,
      vendor_id: market_vendor.vendor_id
    }
  end
end
