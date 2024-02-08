class VendorFacade
  def vendors
    service.vendors.map do |vendor_data|
      Vendor.new(vendor_data)
    end
  end

  def vendor(id)
    Vendor.new(service.vendor(id))
  end

  private

  def service
    @_service ||= MoneyMarketService.new
  end
end
