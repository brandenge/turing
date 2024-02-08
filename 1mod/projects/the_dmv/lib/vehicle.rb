require 'date'

class Vehicle
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine,
                :plate_type,
                :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def register_plate
    @plate_type = case
      when antique? then :antique
      when electric_vehicle? then :ev
      else :regular
    end
  end

  def set_registration_date
    @registration_date = Date.today
  end
end
