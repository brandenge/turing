class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    return nil unless @services.include?('Vehicle Registration')
    collect_fee(car.register_plate)
    car.set_registration_date
    @registered_vehicles << car
  end

  def administer_written_test(registrant)
    if !@services.include?('Written Test') ||
       registrant.age < 16 ||
       !registrant.permit?
      return false
    end
    registrant.set_license_data(:written, true)
    true
  end

  def administer_road_test(registrant)
    if !@services.include?('Road Test') || !registrant.written?
      return false
    end
    registrant.set_license_data(:license, true)
    true
  end

  def renew_drivers_license(registrant)
    if !@services.include?('Renew License') || !registrant.license?
      return false
    end
    registrant.set_license_data(:renewed, true)
    true
  end

  def collect_fee(plate_type)
    @collected_fees +=
    case plate_type
      when :antique then 25
      when :regular then 100
      when :ev then 200
      else 0
    end
  end
end
