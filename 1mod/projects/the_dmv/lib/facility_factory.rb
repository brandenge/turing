require './lib/facility'
require 'json'

class FacilityFactory
  def create_facilities(facilities_data)
    case get_us_state(facilities_data)
      when :OR then create_oregon_facilities(facilities_data)
      when :NY then create_new_york_facilities(facilities_data)
      when :MO then create_missouri_facilities(facilities_data)
      else nil
    end
  end

  def get_us_state(facilities_data)
    if (address = facilities_data.first&.dig(:location_1, :human_address))
      facilities_data = [JSON.parse(address, symbolize_names: true)]
    end
    facilities_data&.first&.dig(:state)&.to_sym
  end

  def create_oregon_facilities(facilities_data)
    facilities_data.map do |facility|
      address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
      formatted_address = "#{address[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}"

      Facility.new({
        name: facility[:title].upcase,
        address: formatted_address.upcase,
        phone: facility[:phone_number].delete('-')
      })
    end
  end

  def create_new_york_facilities(facilities_data)
    facilities_data.map do |facility|
      Facility.new({
        name: facility[:office_name],
        address: "#{facility[:street_address_line_1]} " +
        "#{facility[:street_address_line_2] ?
           facility[:street_address_line_2] + ' ' : ''}" +
        "#{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
        phone: facility[:public_phone_number]
      })
    end
  end

  def create_missouri_facilities(facilities_data)
    facilities_data.map do |facility|
      Facility.new({
        name: facility[:name].strip,
        address: "#{facility[:address1]} " +
        "#{facility[:address2] ?
           facility[:address2] + ' ' : ''}" +
        "#{facility[:city].strip} #{facility[:state]} #{facility[:zipcode]}",
        phone: facility[:phone]&.delete('() -')
      })
    end
  end
end
