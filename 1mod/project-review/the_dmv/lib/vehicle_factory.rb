class VehicleFactory
  def create_vehicles(database)
    vehicle_specs = []
    database.each do |car|
      vehicle_specs << Vehicle.new({vin: car[:vin_1_10], year: car[:model_year], make: car[:make], model: car[:model], engine: :ev})
    end
    vehicle_specs
  end
end





