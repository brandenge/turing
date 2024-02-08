class FacilityFactory
  def create_facilities(database)
    facility_specs = []
    require 'pry-byebug'; require 'pry'; binding.pry;
    database.each do |facility|
      facility_specs << Facility.new({
        name: facility[:title] || facility[:office_name] || facility[:name].strip,
        address: parse_address(facility),
        phone: facility[:phone_number] || facility[:public_phone_number] || facility[:phone]
      })
    end
    facility_specs
  end

  def or_concatenate(human_address)
    human_address = JSON.parse(human_address)
    human_address["address"] + " " + human_address["city"] + " " + human_address["state"] + " " + human_address["zip"]
  end

  def ny_concatenate(address)
    if address.key? (:street_address_line_2)
      address[:street_address_line_1] + " " + address[:street_address_line_2] + " " + address[:city] + " " + address[:state] + " " + address[:zip_code]
    else
      address[:street_address_line_1] + " " + address[:city] + " " + address[:state] + " " + address[:zip_code]
    end
  end

  def mo_concatenate(address)
    address[:address1] + " " + address[:city].strip + " " + address[:state] + " " + address[:zipcode]
  end

  def parse_address(facility)
    if facility.key? :location_1
      or_concatenate(facility[:location_1][:human_address])
    elsif facility.key? :street_address_line_1
      ny_concatenate(facility)
    else
      mo_concatenate(facility)
    end
  end
end
