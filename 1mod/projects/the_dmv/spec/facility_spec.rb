require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new(FACILITY_1)
    @facility_2 = Facility.new(FACILITY_2)

    @cruz = Vehicle.new(CRUZ)
    @bolt = Vehicle.new(BOLT)
    @camaro = Vehicle.new(CAMARO)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq(FACILITY_1[:name])
      expect(@facility_1.address).to eq(FACILITY_1[:address])
      expect(@facility_1.phone).to eq(FACILITY_1[:phone])
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can initialize again' do
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq(FACILITY_2[:name])
      expect(@facility_2.address).to eq(FACILITY_2[:address])
      expect(@facility_2.phone).to eq(FACILITY_2[:phone])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@facility_1.name).to eq(FACILITY_1[:name])
    end

    it 'has a different name' do
      expect(@facility_2.name).to eq(FACILITY_2[:name])
    end
  end

  describe '#address' do
    it 'has an address' do
      expect(@facility_1.address).to eq(FACILITY_1[:address])
    end

    it 'has a different address' do
      expect(@facility_2.address).to eq(FACILITY_2[:address])
    end
  end

  describe '#phone' do
    it 'has a phone number' do
      expect(@facility_1.phone).to eq(FACILITY_1[:phone])
    end

    it 'has a different phone number' do
      expect(@facility_2.phone).to eq(FACILITY_2[:phone])
    end
  end

  describe '#services' do
    it 'returns an array' do
      expect(@facility_1.services).to be_a(Array)
      expect(@facility_2.services).to be_a(Array)
    end

    it 'has an array of services that starts empty' do
      expect(@facility_1.services).to eq([])
      expect(@facility_2.services).to eq([])
    end

    it 'saves services that are added' do
      @facility_1.add_service('New Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License'])

      @facility_1.add_service('Renew Drivers License')
      expect(@facility_1.services)
        .to eq(['New Drivers License', 'Renew Drivers License'])

      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(
        ['New Drivers License',
         'Renew Drivers License',
         'Vehicle Registration'
      ])
    end
  end

  describe '#registered_vehicles' do
    it 'starts empty' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'returns an array' do
      expect(@facility_1.registered_vehicles).to be_a(Array)
      expect(@facility_2.registered_vehicles).to be_a(Array)
    end

    it 'contains an array of Vehicle objects' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles.all? do |vehicle|
        vehicle.is_a?(Vehicle)
      end).to be(true)
    end
  end

  describe '#collected_fees' do
    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'returns an integer' do
      expect(@facility_1.collected_fees).to be_a(Integer)
      expect(@facility_2.collected_fees).to be_a(Integer)
    end

    it 'starts at 0' do
      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'collects $25 for an antique vehicle being registered' do
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects $100 for a regular vehicle being registered' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collects $200 for an electric vehicle being registered' do
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'collects multiple fees' do
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#add_service' do
    before(:each) do
      expect(@facility_1.services).to eq([])
      expect(@facility_2.services).to eq([])
    end

    it 'can add 1 service' do
      @facility_1.add_service('New Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License'])
    end

    it 'can add 2 services' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License'])
    end

    it 'can add 3 services' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

    it 'returns an array of strings' do
      expect(@facility_1.services).to be_a(Array)
      expect(@facility_1.services.all? { |service| service.is_a?(String) }).to be(true)
    end
  end


  describe '#register_vehicle' do
    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'adds a vehicle to the registered vehicle list' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'adds multiple vehicles to the registered vehicle list' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt])
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
    end

    it 'returns the registered vehicle list' do
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @bolt])
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @bolt, @camaro])
    end

    it 'add a plate type to a vehicle' do
      expect(@cruz.plate_type).to be(nil)
      expect(@bolt.plate_type).to be(nil)
      expect(@camaro.plate_type).to be(nil)
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@cruz.plate_type).to be(:regular)
      expect(@bolt.plate_type).to be(:ev)
      expect(@camaro.plate_type).to be(:antique)
    end

    it 'adds today\'s date to the vehicle\'s registration date' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@camaro.registration_date).to eq(Date.today)
    end

    it 'does not register the vehicle if the service is not included' do
      expect(@facility_2.registered_vehicles).to eq([])
      @facility_2.register_vehicle(@cruz)
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'does not collect a fee if the service is not included' do
      expect(@facility_2.collected_fees).to eq(0)
      @facility_2.register_vehicle(@cruz)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'returns nil if the service is not included' do
      expect(@facility_2.register_vehicle(@cruz)).to be(nil)
    end
  end

  describe '#administer_written_test' do
    before(:each) do
      @facility_1.add_service('Written Test')

      @registrant_1 = Registrant.new(REGISTRANT_1[:name], REGISTRANT_1[:age], REGISTRANT_1[:permit])
      @registrant_2 = Registrant.new(REGISTRANT_2[:name], REGISTRANT_2[:age])
      @registrant_3 = Registrant.new(REGISTRANT_3[:name], REGISTRANT_3[:age])
    end

    it 'does not do modify anything if there is no written test service' do
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.written?).to be(false)
    end

    it 'returns false if there is no written test service' do
      expect(@facility_2.administer_written_test(@registrant_1)).to be(false)
    end

    it 'does not do modify anything if the registrant does not have a permit' do
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_2.written?).to be(false)
      expect(@registrant_3.written?).to be(false)
    end

    it 'returns false if the registrant does not have a permit' do
      expect(@facility_1.administer_written_test(@registrant_2)).to be(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
    end

    it 'does not do modify anything if the registrant is under 16 years old' do
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.written?).to be(false)
    end

    it 'returns false if the registrant is under 16 years old' do
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
    end

    it 'correctly modifies the registrant\' license data if it successfully administers the written test' do
      expect(@facility_2.services).to eq([])
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.written?).to be(false)
      @facility_2.add_service('Written Test')
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.written?).to be(true)
    end

    it 'returns true if it successfully administers the written test' do
      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
    end
  end

  describe '#administer_road_test' do
    before(:each) do
      @facility_1.add_service('Road Test')
      @facility_2.add_service('Written Test')

      @registrant_1 = Registrant.new(REGISTRANT_1[:name], REGISTRANT_1[:age], REGISTRANT_1[:permit])
      @registrant_2 = Registrant.new(REGISTRANT_2[:name], REGISTRANT_2[:age])
      @registrant_3 = Registrant.new(REGISTRANT_3[:name], REGISTRANT_3[:age])
    end

    it 'does not modify anything if there is no road test service' do
      expect(@facility_2.services).to eq(['Written Test'])
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_1.license?).to be(false)
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.written?).to be(true)
      @facility_2.administer_road_test(@registrant_1)
      expect(@registrant_1.license?).to be(false)
    end

    it 'returns false if there is no road test service' do
      expect(@facility_2.administer_road_test(@registrant_1)).to be(false)
    end

    it 'does not modify anything if the registrant hasn\'t passed the written test' do
      expect(@facility_1.services).to eq(['Road Test'])
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_1.license?).to be(false)
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_1.license?).to be(false)
    end

    it 'returns false if the registrant hasn\'t passed the written test' do
      expect(@facility_1.administer_road_test(@registrant_1)).to be(false)
    end

    it 'grants a license if the facility has the road test service and the registrant has passed the written test' do
      @facility_2.add_service('Road Test')
      expect(@facility_2.services).to eq(['Written Test', 'Road Test'])
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_1.license?).to be(false)
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(false)
      @facility_2.administer_road_test(@registrant_1)
      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
    end

    it 'returns true if the license is successfully granted' do
      @facility_2.add_service('Road Test')
      @facility_2.administer_written_test(@registrant_1)
      expect(@facility_2.administer_road_test(@registrant_1)).to be(true)
    end
  end

  describe '#renew_drivers_license' do
    before(:each) do
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Renew License')

      @registrant_1 = Registrant.new(REGISTRANT_1[:name], REGISTRANT_1[:age], REGISTRANT_1[:permit])
      @registrant_2 = Registrant.new(REGISTRANT_2[:name], REGISTRANT_2[:age])

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
      expect(@registrant_1.renewed?).to be(false)
    end

    it 'does nothing if the facility has no renew license service' do
      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
      expect(@registrant_1.renewed?).to be(false)

      @facility_2.renew_drivers_license(@registrant_1)

      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
      expect(@registrant_1.renewed?).to be(false)
    end

    it 'returns false if the facility has no renew license service' do
      expect(@facility_2.renew_drivers_license(@registrant_1)).to be(false)
    end

    it 'does nothing if the registrant has no license' do
      expect(@registrant_2.written?).to be(false)
      expect(@registrant_2.license?).to be(false)
      expect(@registrant_2.renewed?).to be(false)

      expect(@facility_1.services.include?('Renew License')).to be(true)
      @facility_1.renew_drivers_license(@registrant_2)

      expect(@registrant_2.written?).to be(false)
      expect(@registrant_2.license?).to be(false)
      expect(@registrant_2.renewed?).to be(false)
    end

    it 'returns false if the registrant has no license' do
      expect(@facility_1.renew_drivers_license(@registrant_2)).to be(false)
    end

    it 'grants a license renewal if the facility has the service and the registrant has a license' do
      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
      expect(@registrant_1.renewed?).to be(false)

      expect(@facility_1.services.include?('Renew License')).to be(true)
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.written?).to be(true)
      expect(@registrant_1.license?).to be(true)
      expect(@registrant_1.renewed?).to be(true)
    end

    it 'returns true if the license renewal is successful' do
      expect(@facility_1.renew_drivers_license(@registrant_1)).to be(true)
    end
  end

  describe '#collect_fee' do
    it 'adds 25 to @collected_fees for an antique plate' do
      expect(@facility_1.collected_fees).to be(0)
      @facility_1.collect_fee(:antique)
      expect(@facility_1.collected_fees).to be(25)
      @facility_1.collect_fee(:antique)
      expect(@facility_1.collected_fees).to be(50)
    end

    it 'adds 100 to @collected_fees for a regular plate' do
      expect(@facility_1.collected_fees).to be(0)
      @facility_1.collect_fee(:regular)
      expect(@facility_1.collected_fees).to be(100)
      @facility_1.collect_fee(:regular)
      expect(@facility_1.collected_fees).to be(200)
    end

    it 'adds 200 to @collected_fees for an ev plate' do
      expect(@facility_1.collected_fees).to be(0)
      @facility_1.collect_fee(:ev)
      expect(@facility_1.collected_fees).to be(200)
      @facility_1.collect_fee(:ev)
      expect(@facility_1.collected_fees).to be(400)
    end

    it 'adds 0 for any invalid plate type' do
      expect(@facility_1.collected_fees).to be(0)
      @facility_1.collect_fee('ev')
      expect(@facility_1.collected_fees).to be(0)
      @facility_1.collect_fee(25)
      expect(@facility_1.collected_fees).to be(0)
    end
  end
end
