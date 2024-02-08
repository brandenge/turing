require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      @facility.add_service('Written Test')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration', 'Written Test'])
      expect(@facility_2.services).to eq([])
    end
  end

  describe 'register vehicle' do
    it 'registers vehicles' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.registered_vehicles).to eq([])
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@camaro)
      @facility.register_vehicle(@bolt)
      expect(@facility.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_2.registered_vehicles).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'sets the vehicle registration date' do
      @facility.add_service('Vehicle Registration')
      expect(@cruz.registration_date).to eq(nil)
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '@facility collected fees' do
    it '@facility collected fees' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.collected_fees).to eq(0)
      @facility.register_vehicle(@cruz)
      expect(@facility.collected_fees).to eq(100)
      @facility.register_vehicle(@bolt)
      expect(@facility.collected_fees).to eq(300)
      @facility.register_vehicle(@camaro)
      expect(@facility.collected_fees).to eq(325)
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#written test' do
    it 'provides license_data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'provides permit?' do
      expect(@registrant_1.permit?).to eq(true)
    end

    describe '#administerad_written_test' do
      it 'requires a facility that administerad_written_test' do
        expect(@facility.administer_written_test(@registrant_1)).to eq(false)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @facility.add_service('Written Test')
        expect(@facility.administer_written_test(@registrant_1)).to eq(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'testing to see if registrant has a permit' do
        @facility.add_service('Written Test')
        expect(@facility.administer_written_test(@registrant_2)).to eq(false)
        @registrant_2.earn_permit
        expect(@facility.administer_written_test(@registrant_2)).to eq(true)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'testing for correct age requirement' do
        @facility.add_service('Written Test')
        expect(@registrant_3.age).to eq(15)
        expect(@facility.administer_written_test(@registrant_3)).to eq(false)
        @registrant_3.earn_permit
        expect(@facility.administer_written_test(@registrant_3)).to eq(false)
      end
    end
  end

  describe '#Road Test' do
    it 'road_test' do
      expect(@facility.administer_road_test(@registrant_3)).to eq(false)
      @registrant_3.earn_permit
      expect(@facility.administer_road_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility.administer_road_test(@registrant_1)).to eq(false)
      @facility.add_service('Road Test')
      @registrant_1.passed_written_test
      expect(@facility.administer_road_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      @registrant_2.passed_written_test
      expect(@facility.administer_road_test(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#Renew License' do
    it 'renew_drivers_license' do
      expect(@facility.renew_drivers_license(@registrant_1)).to eq(false)
      @facility.add_service('Renew License')
      @registrant_1.passed_written_test
      @registrant_1.passed_road_test
      expect(@facility.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(@facility.renew_drivers_license(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @registrant_2.passed_written_test
      @registrant_2.passed_road_test
      expect(@facility.renew_drivers_license(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end


  end

end
# require'pry';binding.pry
