class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees
  def initialize(info)
    # require'pry';binding.pry
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      @collected_fees += vehicle.registration_cost
    end
  end

  def administer_written_test(registrant)
    # require'pry';binding.pry
    if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit
      true
      registrant.passed_written_test
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] == true
      true
      registrant.passed_road_test
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license] == true
      true
      registrant.renew_drivers_license
    else
      false
    end
  end
end

# require'pry';binding.pry
# def renew_drivers_license(registrant)
#   return false if @services.include?('Renew License') == false
#     return false if registrant.license_data[:license] == false
#     registrant.renew_drivers_license
#     true
#   end
# end



# def renew_drivers_license(registrant)
#   if @services.include?('Renew License') && registrant.passed_road_test
#     true
#     registrant.renew_drivers_license
#   else
#     false
#   end
# end
