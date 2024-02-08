class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :county,
              :state,
              :zip,
              :lat,
              :lon,
              :vendors

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @county = data[:county]
    @state = data[:state]
    @zip = data[:zip]
    @lat = data[:lat]
    @lon = data[:lon]
    if data[:vendors].nil?
      @vendors = []
    else
      @vendors = data[:vendors].map do |vendor_data|
        Vendor.new(vendor_data)
      end
    end
  end
end
