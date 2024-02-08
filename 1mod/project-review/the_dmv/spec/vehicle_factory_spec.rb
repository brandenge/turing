require './lib/vehicle'
require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new

    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  describe '#obtaining wa data to make vehicles' do
    it 'creates vehicle instances from wa_ev_registrations' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle_1 = Vehicle.new({vin: "JTDKN3DP8D", year: "2013", make: "TOYOTA", model: "Prius Plug-in", engine: :ev} )
      vehicle_2 = Vehicle.new({vin: "JTDKARFP9J", year: "2018", make:"TOYOTA", model: "Prius Prime", engine: :ev} )
      wa_vehicles = factory.create_vehicles(wa_ev_registrations)
      
      expect(wa_vehicles[0].vin).to eq(vehicle_1.vin)
      expect(wa_vehicles[1].vin).to eq(vehicle_2.vin)
      expect(wa_vehicles[0].year).to eq(vehicle_1.year)
      expect(wa_vehicles[1].year).to eq(vehicle_2.year)
      expect(wa_vehicles[0].make).to eq(vehicle_1.make)
      expect(wa_vehicles[1].make).to eq(vehicle_2.make)
      expect(wa_vehicles[0].model).to eq(vehicle_1.model)
      expect(wa_vehicles[1].model).to eq(vehicle_2.model)
      expect(wa_vehicles[0].engine).to eq(vehicle_1.engine)
      expect(wa_vehicles[1].engine).to eq(vehicle_2.engine)
    end
  end
end                         